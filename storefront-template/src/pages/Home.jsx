import React from 'react';
import Hero from '../components/home/Hero';
import Services from '../components/home/Services';
import Testimonials from '../components/home/Testimonials';
import CallToAction from '../components/home/CallToAction';

const Home = () => {
  return (
    <div>
      <Hero />
      <Services />
      <Testimonials />
      <CallToAction />
    </div>
  );
};

export default Home;
