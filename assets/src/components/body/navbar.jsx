
'use strict'

import React from 'react';
import ReactDOM from 'react-dom';

class Navbar extends React.Component {
  componentDidMount() {
    $(ReactDOM.findDOMNode(this.refs.navbar)).find('li').each((id, dom) => {
        $.localScroll(dom)
    })

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top'
    })

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click( () => $('.navbar-toggle:visible').click() );
  }

  handleClick() { $('*').blur(); }

  render() {
    return(
      <div id="navbar-main">
        <div className="navbar navbar-default navbar-fixed-top">
          <div className="container">
            <div className="navbar-header">
              <button type="button" className="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span className="icon-bar"></span> <span className="icon-bar"></span> <span className="icon-bar"></span> </button>
              <a className="smoothScroll navbar-brand" href="#home"> <i>Eyeberry</i></a>
            </div>
            <div className="navbar-collapse collapse">
              <ul className="nav navbar-nav navbar-right" ref="navbar">
                <li> <a href="#headerwrap" onClick={this.handleClick}>Home</a></li>
                <li> <a href="#about" onClick={this.handleClick}> About</a></li>
                <li> <a href="#services" onClick={this.handleClick}> Services</a></li>
                <li> <a href="#dossier" onClick={this.handleClick}> Galleries</a></li>
                <li> <a href="#team" onClick={this.handleClick}> Team</a></li>
                <li> <a href="#contact" onClick={this.handleClick}> Contact</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default Navbar;
