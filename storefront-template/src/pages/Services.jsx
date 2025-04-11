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
      description: 'Improve your visibility in search engines and drive more qualified traffic to your website. Our SEO services help your business get found by potential customers when they\'re searching for the products or services you offer.',
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
