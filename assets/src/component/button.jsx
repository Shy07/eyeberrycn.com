
'use strict'

import React from 'react';

class Button extends React.Component {
  render() {
    return (
      <a {...this.props}
        href="javascript:;"
        role="button"
        className={(this.props.className || '') + ' btn'} />
  )}
}

export default Button;
