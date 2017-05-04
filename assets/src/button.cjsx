
'use strict'

React = require 'react'

module.exports = React.createClass
  render: ->
    <a {...this.props}
      href="javascript:;"
      role="button"
      className={(this.props.className || '') + ' btn'} />
