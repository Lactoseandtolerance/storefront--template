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
