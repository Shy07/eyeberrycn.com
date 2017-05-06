
'use strict'

import React from 'react';

class Team extends React.Component {
  render() {
    return (
      <div id="team" name="team" className="table y100">
        <div className="table-cell py3">
          <div className="container">
            <div className="row centered">
              <h2 className="centered">Meet Our Team</h2>
              <hr/>
              <div className="col-md-3 centered">
                <img className="img img-circle" src="assets/img/team/vivian2.jpg" height="120px" width="120px" alt="" />
                <h4>Vivian Shan</h4>
                <p>General Manager<br/></p>
                <a href="skype:vivianshan.eyeberry?chat"><i className="fa fa-skype"></i></a>
                <a href="mailto:vivianshan@eyeberryshanghai.com"><i className="fa fa-envelope"></i></a>
              </div>
              <div className="col-md-3 centered">
                <img className="img img-circle" src="assets/img/team/jia.jpg" height="120px" width="120px" alt="" />
                <h4>Jia Lu</h4>
                <p>Sales Account Manager<br/></p>
                <a href="skype:vivianshan.eyeberry?chat"><i className="fa fa-skype"></i></a>
                <a href="mailto:jia@eyeberryshanghai.com"><i className="fa fa-envelope"></i></a>
              </div>
              <div className="col-md-3 centered">
                <img className="img img-circle" src="assets/img/team/sunny.jpg" height="120px" width="120px" alt="" />
                <h4>Lisa Yan</h4>
                <p>Customer Service Supervisor<br/></p>
                <a href="skype:vivianshan.eyeberry?chat"><i className="fa fa-skype"></i></a>
                <a href="mailto:lisayan@eyeberryshanghai.com"><i className="fa fa-envelope"></i></a>
              </div>
              <div className="col-md-3 centered">
                <img className="img img-circle" src="assets/img/team/lynn.jpg" height="120px" width="120px" alt="" />
                <h4>Mabel Yang</h4>
                <p>Customer Service Supervisor<br/></p>
                <a href="skype:vivianshan.eyeberry?chat"><i className="fa fa-skype"></i></a>
                <a href="mailto:mabelyang@eyeberryshanghai.com"><i className="fa fa-envelope"></i></a>
              </div>
              <div className="col-lg-8 col-lg-offset-2 centered" style={{marginBottom:0}}>
                <p className="large" style={{marginTop: 20, marginBottom:0}}>
                  The team of us is young but professional, <br/>and very pleased to meet you.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default Team;
