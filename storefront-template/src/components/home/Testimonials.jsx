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
