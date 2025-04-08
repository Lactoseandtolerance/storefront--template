import { useState } from 'react';

export const useForm = ({ initialValues, validate, onSubmit }) => {
  const [values, setValues] = useState(initialValues);
  const [errors, setErrors] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setValues({ ...values, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    
    const validationErrors = validate(values);
    setErrors(validationErrors);
    
    if (Object.keys(validationErrors).length === 0) {
      setIsSubmitting(true);
      const result = await onSubmit(values);
      setIsSubmitting(false);
      
      if (result && result.success) {
        setValues(initialValues);
      }
    }
  };

  return {
    values,
    handleChange,
    handleSubmit,
    errors,
    isSubmitting,
  };
};
