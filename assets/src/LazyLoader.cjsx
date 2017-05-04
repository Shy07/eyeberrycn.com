
'use strict'

React = require 'react'
ReactDOM = require 'react-dom'

require 'loading.sass'

module.exports = (componentToBeLoaded) ->
  React.createClass
    getInitialState: ->
      loadedComponent: null

    load: ->
      if (this.state.loadedComponent)
        $(ReactDOM.findDOMNode this.refs.loading).hide()
        return

      this.bundle( (component) =>
        $(ReactDOM.findDOMNode this.refs.loading).hide()
        this.setState loadedComponent: component
      )

    componentDidMount: ->
      loading = $(ReactDOM.findDOMNode this.refs.loading)
      loading.css 'height', '90vh' if ua.firefox
      loading.find('div').fadeIn 500
      setTimeout this.load, 1200 # feel it good

    render: ->
      component = this.state.loadedComponent
      if component
        return React.createElement component, this.props
      <div ref="loading" className="table y90">
        <div className="table-cell py3" style={display:'none'}>
          <div className="loader"></div>
        </div>
      </div>

    bundle: componentToBeLoaded
