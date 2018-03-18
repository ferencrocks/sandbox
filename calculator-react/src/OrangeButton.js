import React from 'react';

const OrangeButton = function(props) {
  return (
    <button
      className="orange"
      onClick={props.onClick}>
      {props.label}
    </button>);
};

export default OrangeButton;