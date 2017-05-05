
'use strict'

import React from 'react';

class Service extends React.Component {
  render() {
    return (
      <div id="services" name="services" className="table y100">
        <div className="table-cell py4">
          <div className="container">
            <div className="row">
              <h2 className="centered">Our Services</h2>
              <hr/>
              <div className="col-lg-8 col-lg-offset-2">
                <p className="large">
                  Our team offers comprehensive and diversified products <br/>in a one-package service mode of design, independent R&D and production.
                </p>
              </div>
              <div className="col-md-4 callout"> <i className="fa fa-desktop fa-3x" style={{color:'#f5fbce'}}></i>
                <h3>Design & Edit</h3>
                <p>Our designer offers the beautiful layout doucuments, whatever with or not your original design.
                </p>
              </div>
              <div className="col-md-4 callout"> <i className="fa fa-gears fa-3x" style={{color:'#f5fbce'}}></i>
                <h3>Development & Produce</h3>
                <p> Our factory is well-equipped enough to give you a satisfied delivery <br />date and ensure the quality of product.
                </p>
              </div>
              <div className="col-md-4 callout"> <i className="fa fa-dot-circle-o fa-3x" style={{color:'#f5fbce'}}></i>
                <h3>Delivery & Track</h3>
                <p>Our customer service will communicate with designer, factory, express delivery and so on, <br/>to deliver the product quickly and safely.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

module.exports = Service;
