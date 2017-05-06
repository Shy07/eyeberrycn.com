
import React from 'react';
import ReactDOM from 'react-dom';

window.jQuery = require('jquery');
window.$ = window.jQuery;

import 'bootstrap/dist/css/bootstrap.css';
import 'font-awesome/css/font-awesome.css';
import 'bootstrap';
import 'main.sass';
import 'loading.sass';
import 'jquery.scrollto';
import 'jquery.localscroll';

import Navbar from './components/body/navbar';
import Home from './components/body/home';
import About from './components/body/about';
import Service from './components/body/service';
import Gallery from './components/body/gallery';
import Team from './components/body/team';
import Contact from './components/body/contact';

class Body extends React.Component {
  componentDidMount() {
    if (ua.firefox) {
      $(window).bind('resize', () => $('.y100').css('height', '100vh'));
      $(window).resize();
    }
    if (ua.edge) $('hr').css('left', 0);
    $(ReactDOM.findDOMNode(this.refs.body)).fadeIn(1200);
  }
  render() {
    return (
      <div ref="body" style={{display: 'none'}}>
        <Navbar />
        <Home />
        <About />
        <Service />
        <Gallery />
        <Team />
        <Contact />
      </div>
    );
  }
}

export default Body;
