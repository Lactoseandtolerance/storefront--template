#!/bin/bash

# Small Business Website Setup Script (Updated)
# This script sets up a React Vite project with all necessary dependencies 
# for a modern small business website template
# With fixes for dependency compatibility issues

# Text styling
BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Print header
echo -e "${BOLD}${BLUE}=========================================${NC}"
echo -e "${BOLD}${BLUE}  Small Business Website Setup Script    ${NC}"
echo -e "${BOLD}${BLUE}=========================================${NC}"
echo ""

# Check for Node.js installation
echo -e "${BOLD}Checking prerequisites...${NC}"
if ! command -v node &> /dev/null; then
    echo -e "${RED}Error: Node.js is not installed.${NC}"
    echo "Please install Node.js before running this script."
    echo "Visit https://nodejs.org/ to download and install."
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo -e "${RED}Error: npm is not installed.${NC}"
    echo "Please install npm before running this script."
    exit 1
fi

# Get project name from user
read -p "Enter your project name (lowercase, no spaces): " PROJECT_NAME

# Validate project name (only lowercase letters, numbers, and hyphens)
if ! [[ $PROJECT_NAME =~ ^[a-z0-9-]+$ ]]; then
    echo -e "${RED}Error: Project name should contain only lowercase letters, numbers, and hyphens.${NC}"
    exit 1
fi

# Create Vite React project
echo -e "\n${BOLD}Creating a new Vite React project...${NC}"
npm create vite@latest $PROJECT_NAME -- --template react

# Navigate to project directory
cd $PROJECT_NAME

# Install specific React versions first to ensure compatibility
echo -e "\n${BOLD}Installing specific React versions for compatibility...${NC}"
npm install react@18.2.0 react-dom@18.2.0

# Install all dependencies at once with legacy-peer-deps to avoid conflicts
echo -e "\n${BOLD}Installing dependencies...${NC}"
npm install react-router-dom react-helmet-async react-icons --legacy-peer-deps

echo -e "\n${BOLD}Installing development dependencies...${NC}"
npm install -D tailwindcss postcss autoprefixer --legacy-peer-deps

# Initialize Tailwind CSS
echo -e "\n${BOLD}Initializing Tailwind CSS...${NC}"
npx tailwindcss init -p

# Create directory structure
echo -e "\n${BOLD}Creating project directory structure...${NC}"
mkdir -p src/components/{layout,home,common,ui}
mkdir -p src/pages
mkdir -p src/hooks
mkdir -p src/utils
mkdir -p src/context
mkdir -p src/styles
mkdir -p src/assets/{images,icons}

# Configure Tailwind
echo -e "\n${BOLD}Configuring Tailwind CSS...${NC}"
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#f0f9ff',
          100: '#e0f2fe',
          200: '#bae6fd',
          300: '#7dd3fc',
          400: '#38bdf8',
          500: '#0ea5e9',
          600: '#0284c7',
          700: '#0369a1',
          800: '#075985',
          900: '#0c4a6e',
          950: '#082f49',
        },
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
EOF

# Create global CSS file
echo -e "\n${BOLD}Creating global CSS file...${NC}"
cat > src/styles/global.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  html {
    @apply scroll-smooth;
  }
  
  body {
    @apply font-sans text-gray-800 antialiased;
  }
  
  h1, h2, h3, h4, h5, h6 {
    @apply font-semibold;
  }
}

@layer components {
  .container {
    @apply max-w-7xl mx-auto px-4 sm:px-6 lg:px-8;
  }
  
  .section {
    @apply py-12 md:py-20;
  }
}
EOF

# Update index.css for Tailwind
cat > src/index.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;
EOF

# Make sure index.css is imported in main.jsx
cat > src/main.jsx << 'EOF'
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
EOF

# Create sample component files
echo -e "\n${BOLD}Creating sample component files...${NC}"

# Create Button component
cat > src/components/ui/Button.jsx << 'EOF'
import React from 'react';

const Button = ({ 
  children, 
  variant = 'primary', 
  size = 'md', 
  className = '', 
  disabled = false,
  type = 'button',
  onClick,
  ...props 
}) => {
  const baseClasses = 'inline-flex items-center justify-center rounded-md font-medium transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2';
  
  const variantClasses = {
    primary: 'bg-primary-600 hover:bg-primary-700 text-white focus:ring-primary-500',
    secondary: 'bg-gray-200 hover:bg-gray-300 text-gray-800 focus:ring-gray-500',
    white: 'bg-white hover:bg-gray-100 text-gray-800 focus:ring-white',
    outline: 'border border-gray-300 bg-transparent hover:bg-gray-100 text-gray-800 focus:ring-gray-500',
    'outline-white': 'border border-white bg-transparent hover:bg-white/10 text-white focus:ring-white',
    danger: 'bg-red-600 hover:bg-red-700 text-white focus:ring-red-500',
  };
  
  const sizeClasses = {
    sm: 'text-sm px-3 py-1.5',
    md: 'text-base px-4 py-2',
    lg: 'text-lg px-6 py-3',
  };
  
  const disabledClasses = disabled ? 'opacity-50 cursor-not-allowed' : 'cursor-pointer';
  
  const buttonClasses = `
    ${baseClasses} 
    ${variantClasses[variant]} 
    ${sizeClasses[size]} 
    ${disabledClasses} 
    ${className}
  `;
  
  return (
    <button
      type={type}
      className={buttonClasses}
      disabled={disabled}
      onClick={onClick}
      {...props}
    >
      {children}
    </button>
  );
};

export default Button;
EOF

# Create Logo component
cat > src/components/ui/Logo.jsx << 'EOF'
import React from 'react';
import { Link } from 'react-router-dom';

const Logo = ({ variant = 'dark' }) => {
  const textColor = variant === 'dark' ? 'text-gray-900' : 'text-white';
  
  return (
    <Link to="/" className="flex items-center">
      <span className={`text-xl font-bold ${textColor}`}>
        YourBusiness
      </span>
    </Link>
  );
};

export default Logo;
EOF

# Create useAnalytics hook
cat > src/hooks/useAnalytics.js << 'EOF'
import { useEffect } from 'react';
import { useLocation } from 'react-router-dom';

export const useAnalytics = () => {
  const location = useLocation();
  
  // Track page views
  useEffect(() => {
    // This would connect to your analytics service
    // Example with Google Analytics
    if (window.gtag) {
      window.gtag('config', 'YOUR-GA-MEASUREMENT-ID', {
        page_path: location.pathname + location.search,
      });
    }
  }, [location]);
  
  // Event tracking function
  const trackEvent = (category, action, label, value) => {
    if (window.gtag) {
      window.gtag('event', action, {
        event_category: category,
        event_label: label,
        value: value,
      });
    }
  };
  
  return { trackEvent };
};
EOF

# Create useForm hook
cat > src/hooks/useForm.js << 'EOF'
import { useState } from 'react';

export const useForm = ({ initialValues, validate, onSubmit }) => {
  const [values, setValues] = useState(initialValues);
  const [errors, setErrors] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setValues({ ...values, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    
    const validationErrors = validate(values);
    setErrors(validationErrors);
    
    if (Object.keys(validationErrors).length === 0) {
      setIsSubmitting(true);
      const result = await onSubmit(values);
      setIsSubmitting(false);
      
      if (result && result.success) {
        setValues(initialValues);
      }
    }
  };

  return {
    values,
    handleChange,
    handleSubmit,
    errors,
    isSubmitting,
  };
};
EOF

# Create a simple App component
cat > src/App.jsx << 'EOF'
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';
import './styles/global.css';
import './index.css';

// This is a placeholder - you'll replace these with your actual components
const Home = () => <div className="p-8">Home Page</div>;
const About = () => <div className="p-8">About Page</div>;
const Contact = () => <div className="p-8">Contact Page</div>;
const NotFound = () => <div className="p-8">Page Not Found</div>;

const App = () => {
  return (
    <HelmetProvider>
      <Router>
        <div className="min-h-screen flex flex-col">
          <header className="bg-primary-600 text-white p-4">
            <div className="container mx-auto">
              <h1 className="text-2xl font-bold">Small Business Template</h1>
              <p>A modern React + Vite starter</p>
            </div>
          </header>

          <main className="flex-grow">
            <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/about" element={<About />} />
              <Route path="/contact" element={<Contact />} />
              <Route path="*" element={<NotFound />} />
            </Routes>
          </main>

          <footer className="bg-gray-800 text-white p-4">
            <div className="container mx-auto">
              <p>© {new Date().getFullYear()} Your Business Name</p>
            </div>
          </footer>
        </div>
      </Router>
    </HelmetProvider>
  );
};

export default App;
EOF

# Update vite.config.js
cat > vite.config.js << 'EOF'
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
  server: {
    port: 3000,
  },
  build: {
    outDir: 'dist',
    minify: 'terser',
    sourcemap: false,
  },
});
EOF

# Create README.md
cat > README.md << EOF
# $PROJECT_NAME

A modern small business website template built with React, Vite, and Tailwind CSS.

## Features

- Responsive design
- Fast development with Vite
- Styling with Tailwind CSS
- SEO optimization
- Analytics tracking
- Contact form with validation
- Optimized for performance

## Getting Started

1. Clone this repository
2. Install dependencies with \`npm install\`
3. Start the development server with \`npm run dev\`
4. Build for production with \`npm run build\`

## Project Structure

- \`src/components\`: Reusable UI components
- \`src/pages\`: Page components
- \`src/hooks\`: Custom React hooks
- \`src/utils\`: Utility functions
- \`src/context\`: React context providers
- \`src/styles\`: Global styles and variables
- \`src/assets\`: Images, icons, and other static assets

## Customization

Customize the theme in \`tailwind.config.js\`.

## License

MIT
EOF

# Setup complete message
echo -e "\n${BOLD}${GREEN}Setup complete!${NC}"
echo -e "${BOLD}Your new project has been created at:${NC} $(pwd)"
echo ""
echo -e "${BOLD}To start the development server:${NC}"
echo -e "  cd $PROJECT_NAME"
echo -e "  npm run dev"
echo ""
echo -e "${BOLD}To build for production:${NC}"
echo -e "  npm run build"
echo ""
echo -e "${YELLOW}Don't forget to customize the template with your business information!${NC}"
echo -e "${BLUE}Happy coding!${NC}"