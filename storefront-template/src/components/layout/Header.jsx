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
