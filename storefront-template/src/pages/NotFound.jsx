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
