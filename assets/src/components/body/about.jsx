
'use strict'

import React from 'react';

class About extends React.Component {
  render() {
    return (
      <div id="about" name="about" className="table y100">
        <div className="table-cell py4">
          <div className="container">
            <div className="row white">
              <div className="col-md-6">
                <img className="img-responsive" src="assets/img/about/about.jpg" />
              </div>
              <div className="col-md-6">
                <h3>About us</h3>
                <p>
                  Eyeberry is a professional corporation specializing in weaving and printing, located in Shanghai.
                  <br/>
                  Our team offers comprehensive and diversified products in a one-package service mode of design, independent R&D and production.
                  <br/>
                  At present, Eyeberry has became an authorized label manufacturer of numerous world-famous brands.
                  <br/>
                  Of course, our business enjoys a good reputation in all of our cutomers.
                </p>
                <h3>Why choose us?</h3>
                <p>
                  Why not?
                  <br/>
                  Our values is pursuing the perfection.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default About;
