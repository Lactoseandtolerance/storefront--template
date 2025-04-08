import { useEffect } from 'react';
import { useLocation } from 'react-router-dom';

export const useAnalytics = () => {
  const location = useLocation();
  
  // Track page views
  useEffect(() => {
    // This would connect to your analytics service
    // Example with Google Analytics
    if (window.gtag) {
      window.gtag('config', 'YOUR-GA-MEASUREMENT-ID', {
        page_path: location.pathname + location.search,
      });
    }
  }, [location]);
  
  // Event tracking function
  const trackEvent = (category, action, label, value) => {
    if (window.gtag) {
      window.gtag('event', action, {
        event_category: category,
        event_label: label,
        value: value,
      });
    }
  };
  
  return { trackEvent };
};
