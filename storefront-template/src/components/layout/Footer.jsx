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
