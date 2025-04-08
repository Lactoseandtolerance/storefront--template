#!/bin/bash

# MVP Components Setup Script
# This script adds essential components to create a minimum viable product
# for a small business website template

# Text styling
BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Print header
echo -e "${BOLD}${BLUE}=========================================${NC}"
echo -e "${BOLD}${BLUE}  MVP Components Setup Script           ${NC}"
echo -e "${BOLD}${BLUE}=========================================${NC}"
echo ""

# Check if we're in a React project
if [ ! -f "package.json" ]; then
    echo -e "${RED}Error: No package.json found. Are you in a React project directory?${NC}"
    exit 1
fi

# Create necessary directories if they don't exist
echo -e "${BOLD}Creating component directories...${NC}"
mkdir -p src/components/{layout,home,common,ui}
mkdir -p src/pages
mkdir -p src/hooks
mkdir -p src/assets/{images,icons}

# Create essential components

# 1. Create Navigation component
echo -e "\n${BOLD}Creating Navigation component...${NC}"
cat > src/components/layout/Navigation.jsx << 'EOF'
import React from 'react';
import { Link, useLocation } from 'react-router-dom';

const Navigation = ({ mobile = false }) => {
  const location = useLocation();
  
  const links = [
    { name: 'Home', path: '/' },
    { name: 'About', path: '/about' },
    { name: 'Services', path: '/services' },
    { name: 'Contact', path: '/contact' },
  ];
  
  const baseClasses = 'transition-colors duration-300';
  const desktopClasses = 'px-4 py-2';
  const mobileClasses = 'block py-3 px-4';
  const activeClasses = 'text-primary-600 font-medium';
  const inactiveClasses = 'text-gray-700 hover:text-primary-600';
  
  return (
    <nav className={mobile ? 'flex flex-col' : 'flex items-center space-x-1'}>
      {links.map((link) => (
        <Link
          key={link.path}
          to={link.path}
          className={`
            ${baseClasses}
            ${mobile ? mobileClasses : desktopClasses}
            ${location.pathname === link.path ? activeClasses : inactiveClasses}
          `}
        >
          {link.name}
        </Link>
      ))}
    </nav>
  );
};

export default Navigation;
EOF

# 2. Create Header component
echo -e "\n${BOLD}Creating Header component...${NC}"
cat > src/components/layout/Header.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import Navigation from './Navigation';

const Header = () => {
  const [scrolled, setScrolled] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 50);
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    <header className={`fixed w-full z-50 transition-all duration-300 ${scrolled ? 'bg-white shadow-md py-2' : 'bg-transparent py-4'}`}>
      <div className="container mx-auto flex items-center justify-between px-4">
        <Link to="/" className="text-xl font-bold text-primary-600">
          YourBusiness
        </Link>
        
        <div className="hidden md:block">
          <Navigation />
        </div>
        
        <div className="flex items-center space-x-4">
          <Link to="/contact" className="hidden md:block bg-primary-600 hover:bg-primary-700 text-white px-4 py-2 rounded-md">
            Contact Us
          </Link>
          
          <button 
            className="md:hidden" 
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
          >
            {mobileMenuOpen ? (
              <span className="text-2xl">×</span>
            ) : (
              <span className="text-2xl">☰</span>
            )}
          </button>
        </div>
      </div>
      
      {mobileMenuOpen && (
        <div className="md:hidden bg-white p-4 shadow-md">
          <Navigation mobile={true} />
          <Link to="/contact" className="block text-center mt-4 bg-primary-600 hover:bg-primary-700 text-white px-4 py-2 rounded-md">
            Contact Us
          </Link>
        </div>
      )}
    </header>
  );
};

export default Header;
EOF

# 3. Create Footer component
echo -e "\n${BOLD}Creating Footer component...${NC}"
cat > src/components/layout/Footer.jsx << 'EOF'
import React from 'react';
import { Link } from 'react-router-dom';

const Footer = () => {
  return (
    <footer className="bg-gray-900 text-white pt-10 pb-6">
      <div className="container mx-auto px-4">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div className="col-span-1 md:col-span-1">
            <Link to="/" className="text-xl font-bold text-white">
              YourBusiness
            </Link>
            <p className="mt-4 text-gray-400">
              Professional web solutions for small businesses looking to grow their online presence.
            </p>
          </div>
          
          <div>
            <h3 className="text-lg font-semibold mb-4">Quick Links</h3>
            <ul className="space-y-2">
              <li><Link to="/" className="text-gray-400 hover:text-white transition">Home</Link></li>
              <li><Link to="/about" className="text-gray-400 hover:text-white transition">About Us</Link></li>
              <li><Link to="/services" className="text-gray-400 hover:text-white transition">Services</Link></li>
              <li><Link to="/contact" className="text-gray-400 hover:text-white transition">Contact</Link></li>
            </ul>
          </div>
          
          <div>
            <h3 className="text-lg font-semibold mb-4">Services</h3>
            <ul className="space-y-2">
              <li><Link to="/services" className="text-gray-400 hover:text-white transition">Web Design</Link></li>
              <li><Link to="/services" className="text-gray-400 hover:text-white transition">E-Commerce</Link></li>
              <li><Link to="/services" className="text-gray-400 hover:text-white transition">SEO Services</Link></li>
              <li><Link to="/services" className="text-gray-400 hover:text-white transition">Website Maintenance</Link></li>
            </ul>
          </div>
          
          <div>
            <h3 className="text-lg font-semibold mb-4">Contact Info</h3>
            <ul className="space-y-2 text-gray-400">
              <li className="flex items-start">
                <span className="mr-2">📍</span> 
                <span>123 Business Ave, Suite 200<br/>San Francisco, CA 94107</span>
              </li>
              <li className="flex items-center">
                <span className="mr-2">📞</span>
                <span>(555) 123-4567</span>
              </li>
              <li className="flex items-center">
                <span className="mr-2">✉️</span>
                <span>contact@yourbusiness.com</span>
              </li>
            </ul>
          </div>
        </div>
        
        <div className="border-t border-gray-800 mt-10 pt-6 flex flex-col md:flex-row justify-between items-center">
          <p className="text-gray-500 text-sm">
            © {new Date().getFullYear()} Your Business Name. All rights reserved.
          </p>
          <div className="mt-4 md:mt-0">
            <ul className="flex space-x-4 text-sm text-gray-500">
              <li><Link to="/privacy" className="hover:text-gray-400">Privacy Policy</Link></li>
              <li><Link to="/terms" className="hover:text-gray-400">Terms of Service</Link></li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
EOF

# 4. Create Hero component
echo -e "\n${BOLD}Creating Hero component...${NC}"
cat > src/components/home/Hero.jsx << 'EOF'
import React from 'react';
import { Link } from 'react-router-dom';

const Hero = () => {
  return (
    <section className="relative h-screen flex items-center">
      <div className="absolute inset-0 bg-gradient-to-r from-blue-600 to-purple-600 opacity-90"></div>
      
      <div className="container mx-auto px-4 z-10 text-white">
        <div className="max-w-2xl">
          <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-4">
            Grow Your Business With Our Solutions
          </h1>
          <p className="text-xl mb-8 opacity-90">
            We help small businesses thrive in the digital world with professional web development and marketing strategies.
          </p>
          <div className="flex flex-col sm:flex-row gap-4">
            <Link to="/services" className="bg-white hover:bg-gray-100 text-gray-800 px-6 py-3 rounded-md font-medium text-center">
              Our Services
            </Link>
            <Link to="/contact" className="border border-white bg-transparent hover:bg-white/10 text-white px-6 py-3 rounded-md font-medium text-center">
              Contact Us
            </Link>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Hero;
EOF

# 5. Create Services component
echo -e "\n${BOLD}Creating Services component...${NC}"
cat > src/components/home/Services.jsx << 'EOF'
import React from 'react';
import { Link } from 'react-router-dom';

const ServiceCard = ({ title, description, icon }) => {
  return (
    <div className="bg-white rounded-lg shadow-md p-6 transition-all duration-300 hover:shadow-lg">
      <div className="text-4xl text-primary-600 mb-4">{icon}</div>
      <h3 className="text-xl font-bold mb-2">{title}</h3>
      <p className="text-gray-600 mb-4">{description}</p>
      <Link to="/services" className="text-primary-600 font-medium hover:text-primary-700">
        Learn more →
      </Link>
    </div>
  );
};

const Services = () => {
  const services = [
    {
      title: 'Responsive Web Design',
      description: 'Mobile-friendly websites that look great on all devices and screen sizes.',
      icon: '🎨'
    },
    {
      title: 'E-Commerce Solutions',
      description: 'Secure online stores with payment processing and inventory management.',
      icon: '🛒'
    },
    {
      title: 'SEO Optimization',
      description: 'Improve your search engine rankings and drive more traffic to your site.',
      icon: '📈'
    },
    {
      title: 'Website Maintenance',
      description: 'Regular updates, security patches, and content management support.',
      icon: '🔧'
    }
  ];
  
  return (
    <section className="py-16 bg-gray-50">
      <div className="container mx-auto px-4">
        <div className="text-center mb-12">
          <h2 className="text-3xl font-bold mb-4">Our Services</h2>
          <p className="text-gray-600 max-w-2xl mx-auto">
            We offer a comprehensive range of web development services to help your business succeed online.
          </p>
        </div>
        
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {services.map((service, index) => (
            <ServiceCard key={index} {...service} />
          ))}
        </div>
      </div>
    </section>
  );
};

export default Services;
EOF

# 6. Create Testimonials component
echo -e "\n${BOLD}Creating Testimonials component...${NC}"
cat > src/components/home/Testimonials.jsx << 'EOF'
import React from 'react';

const TestimonialCard = ({ quote, author, company }) => {
  return (
    <div className="bg-white rounded-lg shadow-md p-6">
      <div className="text-4xl text-primary-200 mb-4">"</div>
      <p className="text-gray-700 mb-6 italic">{quote}</p>
      <div>
        <p className="font-bold">{author}</p>
        <p className="text-gray-600">{company}</p>
      </div>
    </div>
  );
};

const Testimonials = () => {
  const testimonials = [
    {
      quote: "Working with this team transformed our online presence. Our new website has significantly increased customer inquiries and sales.",
      author: "Sarah Johnson",
      company: "Riverdale Bakery"
    },
    {
      quote: "The e-commerce solution they built for us was exactly what we needed. User-friendly, secure, and it looks fantastic.",
      author: "Michael Chen",
      company: "Urban Fitness Gear"
    },
    {
      quote: "Their ongoing support and maintenance has been invaluable. They're responsive, professional, and always deliver quality work.",
      author: "Lisa Rodriguez",
      company: "Sunshine Daycare"
    }
  ];
  
  return (
    <section className="py-16 bg-gray-100">
      <div className="container mx-auto px-4">
        <div className="text-center mb-12">
          <h2 className="text-3xl font-bold mb-4">What Our Clients Say</h2>
          <p className="text-gray-600 max-w-2xl mx-auto">
            Don't just take our word for it - hear from some of our satisfied clients.
          </p>
        </div>
        
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {testimonials.map((testimonial, index) => (
            <TestimonialCard key={index} {...testimonial} />
          ))}
        </div>
      </div>
    </section>
  );
};

export default Testimonials;
EOF

# 7. Create ContactForm component
echo -e "\n${BOLD}Creating ContactForm component...${NC}"
cat > src/components/common/ContactForm.jsx << 'EOF'
import React, { useState } from 'react';

const ContactForm = () => {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone: '',
    message: ''
  });
  
  const [errors, setErrors] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [formSubmitted, setFormSubmitted] = useState(false);
  
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };
  
  const validate = () => {
    const newErrors = {};
    
    if (!formData.name.trim()) {
      newErrors.name = 'Name is required';
    }
    
    if (!formData.email.trim()) {
      newErrors.email = 'Email is required';
    } else if (!/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i.test(formData.email)) {
      newErrors.email = 'Invalid email address';
    }
    
    if (!formData.message.trim()) {
      newErrors.message = 'Message is required';
    }
    
    return newErrors;
  };
  
  const handleSubmit = (e) => {
    e.preventDefault();
    
    const newErrors = validate();
    setErrors(newErrors);
    
    if (Object.keys(newErrors).length === 0) {
      setIsSubmitting(true);
      
      // Simulate API call
      setTimeout(() => {
        setIsSubmitting(false);
        setFormSubmitted(true);
        setFormData({ name: '', email: '', phone: '', message: '' });
      }, 1500);
    }
  };
  
  if (formSubmitted) {
    return (
      <div className="bg-green-50 border border-green-200 rounded-lg p-6 text-center">
        <div className="text-3xl mb-4">✅</div>
        <h3 className="text-xl font-bold text-green-800 mb-2">Thank You!</h3>
        <p className="text-green-700">
          Your message has been successfully sent. We'll get back to you shortly.
        </p>
        <button 
          onClick={() => setFormSubmitted(false)}
          className="mt-4 bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded"
        >
          Send Another Message
        </button>
      </div>
    );
  }
  
  return (
    <form onSubmit={handleSubmit} className="space-y-6 bg-white p-6 rounded-lg shadow-md">
      <div>
        <label htmlFor="name" className="block text-sm font-medium text-gray-700 mb-1">
          Full Name *
        </label>
        <input
          id="name"
          name="name"
          type="text"
          value={formData.name}
          onChange={handleChange}
          className={`w-full px-4 py-2 border rounded-md focus:ring-2 focus:ring-primary-500 focus:outline-none ${
            errors.name ? 'border-red-500' : 'border-gray-300'
          }`}
        />
        {errors.name && <p className="mt-1 text-sm text-red-600">{errors.name}</p>}
      </div>
      
      <div>
        <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-1">
          Email Address *
        </label>
        <input
          id="email"
          name="email"
          type="email"
          value={formData.email}
          onChange={handleChange}
          className={`w-full px-4 py-2 border rounded-md focus:ring-2 focus:ring-primary-500 focus:outline-none ${
            errors.email ? 'border-red-500' : 'border-gray-300'
          }`}
        />
        {errors.email && <p className="mt-1 text-sm text-red-600">{errors.email}</p>}
      </div>
      
      <div>
        <label htmlFor="phone" className="block text-sm font-medium text-gray-700 mb-1">
          Phone Number (optional)
        </label>
        <input
          id="phone"
          name="phone"
          type="tel"
          value={formData.phone}
          onChange={handleChange}
          className="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-primary-500 focus:outline-none"
        />
      </div>
      
      <div>
        <label htmlFor="message" className="block text-sm font-medium text-gray-700 mb-1">
          Message *
        </label>
        <textarea
          id="message"
          name="message"
          rows="4"
          value={formData.message}
          onChange={handleChange}
          className={`w-full px-4 py-2 border rounded-md focus:ring-2 focus:ring-primary-500 focus:outline-none ${
            errors.message ? 'border-red-500' : 'border-gray-300'
          }`}
        />
        {errors.message && <p className="mt-1 text-sm text-red-600">{errors.message}</p>}
      </div>
      
      <button 
        type="submit" 
        className="w-full bg-primary-600 hover:bg-primary-700 text-white font-medium py-2 px-4 rounded-md transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500"
        disabled={isSubmitting}
      >
        {isSubmitting ? 'Sending...' : 'Send Message'}
      </button>
    </form>
  );
};

export default ContactForm;
EOF

# 8. Create CallToAction component
echo -e "\n${BOLD}Creating CallToAction component...${NC}"
cat > src/components/home/CallToAction.jsx << 'EOF'
import React from 'react';
import { Link } from 'react-router-dom';

const CallToAction = () => {
  return (
    <section className="py-16 bg-primary-600">
      <div className="container mx-auto px-4 text-center">
        <h2 className="text-3xl font-bold text-white mb-4">Ready to Grow Your Business Online?</h2>
        <p className="text-primary-100 max-w-2xl mx-auto mb-8">
          Contact us today to discuss how we can help your business thrive with a professional web presence.
        </p>
        <Link 
          to="/contact" 
          className="bg-white hover:bg-gray-100 text-primary-700 font-medium py-3 px-8 rounded-md inline-block transition-colors"
        >
          Get Started Today
        </Link>
      </div>
    </section>
  );
};

export default CallToAction;
EOF

# 9. Create Home page component
echo -e "\n${BOLD}Creating Home page...${NC}"
cat > src/pages/Home.jsx << 'EOF'
import React from 'react';
import Hero from '../components/home/Hero';
import Services from '../components/home/Services';
import Testimonials from '../components/home/Testimonials';
import CallToAction from '../components/home/CallToAction';

const Home = () => {
  return (
    <div>
      <Hero />
      <Services />
      <Testimonials />
      <CallToAction />
    </div>
  );
};

export default Home;
EOF

# 10. Create About page component
echo -e "\n${BOLD}Creating About page...${NC}"
cat > src/pages/About.jsx << 'EOF'
import React from 'react';

const About = () => {
  return (
    <div className="pt-20">
      <section className="bg-gray-100 py-16">
        <div className="container mx-auto px-4">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl font-bold mb-6">About Our Company</h1>
            <p className="text-gray-600 mb-8">
              We're a team of passionate web developers and designers dedicated to helping small businesses succeed online.
            </p>
          </div>
        </div>
      </section>
      
      <section className="py-16">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
            <div>
              <h2 className="text-3xl font-bold mb-4">Our Story</h2>
              <p className="text-gray-700 mb-4">
                Founded in 2020, our company began with a simple mission: to provide affordable, high-quality web solutions for small businesses looking to establish or improve their online presence.
              </p>
              <p className="text-gray-700 mb-4">
                We recognized that many small business owners struggle with creating effective websites that truly represent their brand and drive business growth. That's why we developed a streamlined process that combines technical expertise with business strategy.
              </p>
              <p className="text-gray-700">
                Today, we've helped hundreds of businesses across various industries build modern, effective websites that convert visitors into customers.
              </p>
            </div>
            <div className="bg-gray-300 h-80 rounded-lg flex items-center justify-center">
              <span className="text-gray-600 text-lg">[Team Photo]</span>
            </div>
          </div>
        </div>
      </section>
      
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold mb-12 text-center">Our Values</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="bg-white p-6 rounded-lg shadow-md">
              <div className="text-4xl text-primary-600 mb-4">🤝</div>
              <h3 className="text-xl font-bold mb-2">Client Partnership</h3>
              <p className="text-gray-600">
                We see ourselves as partners in your business success, not just service providers. Your goals become our goals.
              </p>
            </div>
            <div className="bg-white p-6 rounded-lg shadow-md">
              <div className="text-4xl text-primary-600 mb-4">💡</div>
              <h3 className="text-xl font-bold mb-2">Innovation</h3>
              <p className="text-gray-600">
                We stay at the forefront of web technology to provide you with solutions that are both current and future-proof.
              </p>
            </div>
            <div className="bg-white p-6 rounded-lg shadow-md">
              <div className="text-4xl text-primary-600 mb-4">⭐</div>
              <h3 className="text-xl font-bold mb-2">Quality</h3>
              <p className="text-gray-600">
                We never compromise on quality, delivering websites that are beautiful, functional, and effective at driving business results.
              </p>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default About;
EOF

# 11. Create Services page component
echo -e "\n${BOLD}Creating Services page...${NC}"
cat > src/pages/Services.jsx << 'EOF'
import React from 'react';

const ServiceDetail = ({ title, description, features, icon }) => {
  return (
    <div className="mb-16 border-b border-gray-200 pb-12 last:border-0">
      <div className="flex flex-col md:flex-row md:items-start gap-6">
        <div className="flex-shrink-0 bg-primary-100 text-primary-600 p-4 rounded-full w-16 h-16 flex items-center justify-center text-2xl">
          {icon}
        </div>
        <div>
          <h3 className="text-2xl font-bold mb-3">{title}</h3>
          <p className="text-gray-700 mb-6">{description}</p>
          
          <h4 className="text-lg font-semibold mb-3">What's Included:</h4>
          <ul className="space-y-2">
            {features.map((feature, index) => (
              <li key={index} className="flex items-start">
                <span className="text-primary-600 mr-2">✓</span>
                <span>{feature}</span>
              </li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  );
};

const Services = () => {
  const services = [
    {
      title: 'Responsive Web Design',
      description: 'We create beautiful, functional websites that look great on all devices, from desktop computers to mobile phones. Our mobile-first approach ensures your site provides an optimal viewing experience across all screen sizes.',
      icon: '🎨',
      features: [
        'Custom design tailored to your brand',
        'Mobile-first responsive layouts',
        'User experience (UX) optimization',
        'Cross-browser compatibility',
        'Fast loading speeds',
        'SEO-friendly structure'
      ]
    },
    {
      title: 'E-Commerce Solutions',
      description: 'Transform your business with a professional online store that makes selling your products or services easy. We build secure, user-friendly e-commerce websites that drive sales and streamline your operations.',
      icon: '🛒',
      features: [
        'Secure payment processing',
        'Inventory management',
        'Product catalog setup',
        'Shopping cart functionality',
        'Order tracking system',
        'Mobile shopping experience',
        'Integration with shipping services'
      ]
    },
    {
      title: 'SEO Optimization',
      description: 'Improve your visibility in search engines and drive more qualified traffic to your website. Our SEO services help your business get found by potential customers when they're searching for the products or services you offer.',
      icon: '📈',
      features: [
        'Keyword research and analysis',
        'On-page SEO optimization',
        'Technical SEO improvements',
        'Content optimization',
        'Local SEO for small businesses',
        'Performance tracking and reporting',
        'Ongoing optimization recommendations'
      ]
    },
    {
      title: 'Website Maintenance',
      description: 'Keep your website secure, up-to-date, and performing at its best with our website maintenance services. We handle the technical details so you can focus on running your business.',
      icon: '🔧',
      features: [
        'Regular software updates',
        'Security monitoring and patches',
        'Performance optimization',
        'Backup management',
        'Technical support',
        'Content updates assistance',
        'Monthly reporting'
      ]
    }
  ];
  
  return (
    <div className="pt-20">
      <section className="bg-gray-100 py-16">
        <div className="container mx-auto px-4">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl font-bold mb-6">Our Services</h1>
            <p className="text-gray-600 mb-8">
              We offer comprehensive web development solutions tailored to help small businesses thrive online.
            </p>
          </div>
        </div>
      </section>
      
      <section className="py-12">
        <div className="container mx-auto px-4">
          {services.map((service, index) => (
            <ServiceDetail key={index} {...service} />
          ))}
        </div>
      </section>
      
      <section className="py-16 bg-primary-600 text-white">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-3xl font-bold mb-6">Need a Custom Solution?</h2>
          <p className="max-w-2xl mx-auto mb-8">
            We understand that every business has unique needs. Contact us to discuss a custom web solution tailored specifically for your business.
          </p>
          <a href="/contact" className="bg-white text-primary-700 hover:bg-gray-100 font-medium py-3 px-8 rounded-md inline-block">
            Get in Touch
          </a>
        </div>
      </section>
    </div>
  );
};

export default Services;
EOF

# 12. Create Contact page component
echo -e "\n${BOLD}Creating Contact page...${NC}"
cat > src/pages/Contact.jsx << 'EOF'
import React from 'react';
import ContactForm from '../components/common/ContactForm';

const Contact = () => {
  return (
    <div className="pt-20">
      <section className="bg-gray-100 py-16">
        <div className="container mx-auto px-4">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl font-bold mb-6">Contact Us</h1>
            <p className="text-gray-600 mb-8">
              Have a question or ready to start your project? Reach out to us using the form below or our contact information.
            </p>
          </div>
        </div>
      </section>
      
      <section className="py-16">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-12">
            <div className="lg:col-span-2">
              <h2 className="text-2xl font-bold mb-6">Send Us a Message</h2>
              <ContactForm />
            </div>
            
            <div>
              <h2 className="text-2xl font-bold mb-6">Contact Information</h2>
              <div className="bg-white shadow-md rounded-lg p-6">
                <div className="mb-6">
                  <h3 className="text-lg font-semibold mb-2">Address</h3>
                  <p className="text-gray-700">
                    123 Business Ave, Suite 200<br />
                    San Francisco, CA 94107<br />
                    United States
                  </p>
                </div>
                
                <div className="mb-6">
                  <h3 className="text-lg font-semibold mb-2">Phone</h3>
                  <p className="text-gray-700">(555) 123-4567</p>
                </div>
                
                <div className="mb-6">
                  <h3 className="text-lg font-semibold mb-2">Email</h3>
                  <p className="text-gray-700">contact@yourbusiness.com</p>
                </div>
                
                <div>
                  <h3 className="text-lg font-semibold mb-2">Business Hours</h3>
                  <p className="text-gray-700">
                    Monday - Friday: 9am - 5pm<br />
                    Saturday & Sunday: Closed
                  </p>
                </div>
              </div>
              
              <div className="mt-8 bg-gray-300 h-64 rounded-lg flex items-center justify-center">
                <span className="text-gray-600 text-lg">[Google Map]</span>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Contact;
EOF

# 13. Create NotFound page component
echo -e "\n${BOLD}Creating NotFound page...${NC}"
cat > src/pages/NotFound.jsx << 'EOF'
import React from 'react';
import { Link } from 'react-router-dom';

const NotFound = () => {
  return (
    <div className="min-h-screen flex items-center justify-center p-4">
      <div className="text-center">
        <h1 className="text-9xl font-bold text-primary-600">404</h1>
        <h2 className="text-3xl font-bold mt-4 mb-6">Page Not Found</h2>
        <p className="text-gray-600 max-w-md mx-auto mb-8">
          Sorry, the page you are looking for doesn't exist or has been moved.
        </p>
        <Link to="/" className="bg-primary-600 hover:bg-primary-700 text-white font-medium py-2 px-6 rounded-md">
          Back to Home
        </Link>
      </div>
    </div>
  );
};

export default NotFound;
EOF

# 14. Update App.jsx to use the new components
echo -e "\n${BOLD}Updating App.jsx...${NC}"
cat > src/App.jsx << 'EOF'
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';
import Header from './components/layout/Header';
import Footer from './components/layout/Footer';
import Home from './pages/Home';
import About from './pages/About';
import Services from './pages/Services';
import Contact from './pages/Contact';
import NotFound from './pages/NotFound';
import './styles/global.css';
import './index.css';

const App = () => {
  return (
    <HelmetProvider>
      <Router>
        <div className="flex flex-col min-h-screen">
          <Header />
          <main className="flex-grow">
            <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/about" element={<About />} />
              <Route path="/services" element={<Services />} />
              <Route path="/contact" element={<Contact />} />
              <Route path="*" element={<NotFound />} />
            </Routes>
          </main>
          <Footer />
        </div>
      </Router>
    </HelmetProvider>
  );
};

export default App;
EOF

# Provide success message
echo -e "\n${BOLD}${GREEN}MVP components created successfully!${NC}"
echo -e "The following components have been added to your project:"
echo -e " - Layout components (Header, Footer, Navigation)"
echo -e " - Home page components (Hero, Services, Testimonials, CallToAction)"
echo -e " - Page components (Home, About, Services, Contact, NotFound)"
echo -e " - Common components (ContactForm)"
echo ""
echo -e "${BOLD}To start the development server:${NC}"
echo -e "  npm run dev"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo -e " - Customize the content and styling to match your business"
echo -e " - Add real images and logo"
echo -e " - Connect the contact form to a backend service"
echo -e " - Add analytics tracking"
echo -e "${BLUE}Happy coding!${NC}"