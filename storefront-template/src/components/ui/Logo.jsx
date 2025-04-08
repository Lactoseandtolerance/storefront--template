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
