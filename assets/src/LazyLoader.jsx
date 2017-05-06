
'use strict'

import React from 'react';
import ReactDOM from 'react-dom';

import 'loading.sass';

class LazyLoader extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      isLoaded: false
    }
  }

  load() {
    new Promise((next) => {
      let result = this.props.componentToBeLoaded();
      setTimeout( () => { next(result) }, 800);
    })
    .then((result) => {
      $(ReactDOM.findDOMNode(this.refs.loading)).hide();
      this.setState({ module: result.default, isLoaded: true });
    });
  }

  componentDidMount() {
    let loading = $(ReactDOM.findDOMNode(this.refs.loading));
    if (ua.firefox) loading.css('height', '90vh');
    loading.find('div').fadeIn(500);
    this.load();
  }

  render() {
    if (this.state.isLoaded) {
      let Component = this.state.module;
      return (
        <Component />
      );
    }
    return (
      <div ref="loading" className="table y90">
        <div className="table-cell py3" style={ {display: 'none'} }>
          <div className="loader"></div>
        </div>
      </div>
    );
  }
}

export const importLazy = (promise) => (
  promise.then((result) => result.default)
);

export default LazyLoader;
