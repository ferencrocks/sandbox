import React from 'react';

const Screen = function(props) {
  return (
    <div className="screen">
      <span>{props.value}</span>
    </div>
  );
};

export default Screen;