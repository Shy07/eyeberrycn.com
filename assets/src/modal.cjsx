
'use strict'

React = require 'react'
ReactDOM = require 'react-dom'

Button = require './button'

module.exports = React.createClass
  componentDidMount: ->
    $(ReactDOM.findDOMNode this).modal backdrop: true, keyboard: false, show: false
  componentWillUnmount: -> $(ReactDOM.findDOMNode this).off 'hidden', this.handleHidden
  close: -> $(ReactDOM.findDOMNode this).modal 'hide'
  open: -> $(ReactDOM.findDOMNode this).modal 'show'
  handleCancel: -> this.props.onCancel() if this.props.onCancel
  handleConfirm: -> this.props.onConfirm() if this.props.onConfirm

  render: ->
    confirmButton = null
    cancelButton = null
    closeButton = null
    confirmButton = (
      <Button
        onClick={this.handleConfirm}
        className="btn-primary">
        {this.props.confirm}
      </Button>
    ) if this.props.confirm
    cancelButton = (
      <Button onClick={this.handleCancel} className="btn-default">
        {this.props.cancel}
      </Button>
    ) if this.props.cancel
    closeButton = (
      <button type="button" className="close" onClick={this.handleCancel}>
        &times;
      </button>
    ) if this.props.cancel
    size = if this.props.size then this.props.size else ''
    color = if this.props.color then this.props.color else ''
    footer = (
      <div className="modal-footer #{color}">
        {cancelButton}
        {confirmButton}
      </div>
    )
    <div className="modal fade">
      <div className="modal-dialog #{size}">
        <div className="modal-content">
          <div className="modal-header #{color}">
            {closeButton}
            <h4>{this.props.title}</h4>
          </div>
          <div className="modal-body #{color}" style={minHeight: '100vh'}>
            {this.props.children}
          </div>
          {footer if this.props.footer == 'true'}
        </div>
      </div>
    </div>
