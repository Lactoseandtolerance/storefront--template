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
