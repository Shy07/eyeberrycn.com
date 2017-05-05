
'use strict'

import React from 'react';
import ReactDOM from 'react-dom';

import 'loading.sass';

class LazyLoader extends React.Component {

  constructor(componentToBeLoaded) {
    super();
    this.componentToBeLoaded = componentToBeLoaded;
  }

  getInitialState() {
    return {
      loadedComponent: null
    }
  }

  load() {
    if (this.state.loadedComponent) {
      $(ReactDOM.findDOMNode(this.refs.loading)).hide();
      return;
    }

    this.bundle( (component) => {
      $(ReactDOM.findDOMNode(this.refs.loading)).hide();
      this.setState({loadedComponent: component});
    })
  }

  componentDidMount() {
    loading = $(ReactDOM.findDOMNode(this.refs.loading));
    if (ua.firefox) loading.css('height', '90vh');
    loading.find('div').fadeIn(500);
    setTimeout(this.load, 1200); // feel it good
  }

  render() {
    component = this.state.loadedComponent;
    if (component) {
      return React.createElement(component, this.props);
    }
    return (<div ref="loading" className="table y90">
      <div className="table-cell py3" style={ {display: 'none'} }>
        <div className="loader"></div>
      </div>
    </div>);
  }

  bundle() {
    return componentToBeLoaded;
  }
}

module.exports = (componentToBeLoaded) => LazyLoader(componentToBeLoaded);
