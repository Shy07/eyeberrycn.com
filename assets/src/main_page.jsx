
import React from 'react';
import ReactDOM from 'react-dom';

window.jQuery = require('jquery');
window.$ = window.jQuery;

import '../css/bootstrap.css';
import '../css/font-awesome.css';
import 'bootstrap';
import 'main.sass';
import 'loading.sass';
import '../js/jquery.easing.1.3.js';
import '../js/smoothscroll.js';

import Navbar from './component/body/navbar';
import Home from './component/body/home';
import About from './component/body/about';
import Service from './component/body/service';
import Gallery from './component/body/gallery';
import Team from './component/body/team';
import Contact from './component/body/contact';

class Body extends React.Component {
  componentDidMount() {
    if (ua.firefox) {
      $(window).bind('resize', () => eles = $('.y100').css('height', '100vh'));
      $(window).resize();
    }
    if (ua.edge) eles = $('hr').css('left', 0);
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
