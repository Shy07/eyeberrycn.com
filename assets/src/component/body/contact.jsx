
'use strict'

import React from 'react';

class Contact extends React.Component {
  render() {
    return (
      <div id="contact" name="contact" className="table y100">
        <div className="table-cell py3">
          <div className="container">
            <div className="row">
              <h2 className="centered">Contact Us</h2>
              <hr/>
              <p className="large">
                Hello! If you're interested in working with us, please get in touch using the info below!<br/>And we will get back to you as soon as possible!
              </p>
              <div className="col-md-4 centered" style={{paddingBottom:12}}> <i className="fa fa-phone fa-2x"></i>
                <p style={{marginBottom:0}}> +8621 5980 0770<br/> +8621 5980 0771</p>
              </div>
              <div className="col-md-4" style={{paddingBottom:12}}> <i className="fa fa-envelope-o fa-2x"></i>
                <p style={{marginBottom:0}}>info@eyeberryshanghai.com<br/></p>
              </div>
              <div className="col-md-4" style={{paddingBottom:12}}> <i className="fa fa-map-marker fa-2x"></i>
                <p style={{marginBottom:0}}>Block 2, No. 69, Hua Fang Road<br/>Qing Pu, Shanghai, China 201700</p>
              </div>
            </div>
          </div>
          <hr/>
          <p style={{marginBottom:0}}>&copy; 2016 Eyeberry Shanghai<br/>designed by Lynch</p>
        </div>
      </div>
    )
  }
}

export default Contact;
