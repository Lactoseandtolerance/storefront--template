import React from 'react';
import ContactForm from '../components/common/ContactForm';

const Contact = () => {
  return (
    <div className="pt-20">
      <section className="bg-gray-100 py-16">
        <div className="container mx-auto px-4">
          <div className="max-w-3xl mx-auto text-center">
            <h1 className="text-4xl font-bold mb-6">Contact Us</h1>
            <p className="text-gray-600 mb-8">
              Have a question or ready to start your project? Reach out to us using the form below or our contact information.
            </p>
          </div>
        </div>
      </section>
      
      <section className="py-16">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-12">
            <div className="lg:col-span-2">
              <h2 className="text-2xl font-bold mb-6">Send Us a Message</h2>
              <ContactForm />
            </div>
            
            <div>
              <h2 className="text-2xl font-bold mb-6">Contact Information</h2>
              <div className="bg-white shadow-md rounded-lg p-6">
                <div className="mb-6">
                  <h3 className="text-lg font-semibold mb-2">Address</h3>
                  <p className="text-gray-700">
                    123 Business Ave, Suite 200<br />
                    San Francisco, CA 94107<br />
                    United States
                  </p>
                </div>
                
                <div className="mb-6">
                  <h3 className="text-lg font-semibold mb-2">Phone</h3>
                  <p className="text-gray-700">(555) 123-4567</p>
                </div>
                
                <div className="mb-6">
                  <h3 className="text-lg font-semibold mb-2">Email</h3>
                  <p className="text-gray-700">contact@yourbusiness.com</p>
                </div>
                
                <div>
                  <h3 className="text-lg font-semibold mb-2">Business Hours</h3>
                  <p className="text-gray-700">
                    Monday - Friday: 9am - 5pm<br />
                    Saturday & Sunday: Closed
                  </p>
                </div>
              </div>
              
              <div className="mt-8 bg-gray-300 h-64 rounded-lg flex items-center justify-center">
                <span className="text-gray-600 text-lg">[Google Map]</span>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Contact;
