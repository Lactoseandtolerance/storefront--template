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
