
'use strict'

import React from 'react';
import ReactDOM from 'react-dom';
import Button from './button';

class Modal extends React.Component {
  componentDidMount() {
    $(ReactDOM.findDOMNode(this)).modal({
      backdrop: true, keyboard: false, show: false
    });
  }

  componentWillUnmount() {
    $(ReactDOM.findDOMNode(this)).off('hidden', this.handleHidden);
  }

  close() {
    $(ReactDOM.findDOMNode(this)).modal('hide');
  }

  open() {
    $(ReactDOM.findDOMNode(this)).modal('show');
  }

  handleCancel() {
    if (this.props.onCancel) this.props.onCancel();
  }

  handleConfirm() {
    if (this.props.onConfirm) this.props.onConfirm();
  }

  render() {
    let confirmButton = null;
    let cancelButton = null;
    let closeButton = null;
    if (this.props.confirm) {
      confirmButton = (
        <Button
          onClick={this.handleConfirm}
          className="btn-primary">
          {this.props.confirm}
        </Button>
      );
    }
    if (this.props.cancel) {
      cancelButton = (
        <Button onClick={this.close.bind(this)} className="btn-default">
          {this.props.cancel}
        </Button>
      );
    }
    if (this.props.cancel) {
      closeButton = (
        <button type="button" className="close" onClick={this.close.bind(this)}>
          &times;
        </button>
      );
    }
    let size = this.props.size ? this.props.size : '';
    let color = this.props.color ? this.props.color : '';
    let footer = (
      <div className={"modal-footer " + color}>
        {cancelButton}
        {confirmButton}
      </div>
    );
    return (
      <div className="modal fade">
        <div className={"modal-dialog " + size}>
          <div className="modal-content">
            <div className={"modal-header " + color}>
              {closeButton}
              <h4>{this.props.title}</h4>
            </div>
            <div className={"modal-body " + color} style={{minHeight: '100vh'}}>
              {this.props.children}
            </div>
            {(this.props.footer === 'true') ? footer : null}
          </div>
        </div>
      </div>
    );
  }
}

export default Modal;
