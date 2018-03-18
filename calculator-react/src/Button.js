import React from 'react';

const Button = function(props) {
  return (
    <button
      className={props.threeQuarter ? 'three-quarter' : ''}
      onClick={props.onClick} >
      {props.label}
    </button>
  );
};

export default Button;