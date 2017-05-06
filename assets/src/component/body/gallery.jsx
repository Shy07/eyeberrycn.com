
'use strict'

import React from 'react';
import ReactDOM from 'react-dom';
// ModalCont = LazyLoader require 'bundle?lazy!modal_cont';
import Modal from '../modal';
import ModalCont from '../modal_cont';

class Gallery extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      inited: false
    }
  }

  componentDidMount() {
    $('a.page-scroll').bind('click', (event) => {
        $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
      }
    )
  }

  handleClick() {
    $('*').blur();
  }

  openModal(event) {
    let grid = this.refs[$(event.target).attr('name')];
    if (!this.state.inited) {
      this.state.inited = true;
      $(ReactDOM.findDOMNode(grid)).on('shown.bs.modal', (() => {
        this.refs.galleryMasonry.initMasonry() }).bind(this)
      )
    }
    grid.open();
  }

  closeModal(modal) {
    console.log(modal);
    this.refs[modal].close();
  }

  render() {
    let modal1 = (
      <Modal
        ref="galleryModal"
        size = "modal-lg"
        color = "black"
        footer = "true"
        cancel = "close"
        onCancel = {this.closeModal.bind(this), 'galleryModal'}
        title="">
        <ModalCont ref="galleryMasonry" collection="1st"/>
      </Modal>
    )
    return (
      <div id="dossier" name="dossier" className="table y100">
        <div className="table-cell py1">
          <div className="container">
            <div className="row">
              <h2 className="centered">Galleries of <i>Eyeberry</i></h2>
              <hr/>
            </div>
            <div className="container">
              <div className="row">
                <div className="col-md-offset-2 col-md-8">
                  <div className="grid mask">
                    <figure>
                      <img className="img-responsive" src="assets/img/dossiers/cover01.jpg" alt="" />
                      <figcaption>
                        <h5>1st collection</h5>
                        <a className="btn btn-default" name="galleryModal"
                          onClick={this.openModal.bind(this)}>More Details</a>
                      </figcaption>
                    </figure>
                  </div>
                </div>
                {modal1}
              </div>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default Gallery;
