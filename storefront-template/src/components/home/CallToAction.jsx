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
