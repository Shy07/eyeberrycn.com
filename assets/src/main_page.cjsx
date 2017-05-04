React = require 'react'
ReactDOM = require 'react-dom'

window.jQuery = require 'jquery'
window.$ = window.jQuery

require '../css/bootstrap.css'
require '../css/font-awesome.css'
require 'bootstrap'

require 'main.sass'
require 'loading.sass'

require '../js/jquery.easing.1.3.js'
require '../js/smoothscroll.js'

printf = require 'printf'

Masonry = require 'masonry-layout'

Modal = require 'modal'

Navbar = React.createClass
  componentDidMount: ->
    $(ReactDOM.findDOMNode this.refs.navbar).find('li').each (id, dom) ->
      $.localScroll dom

    # Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top'
    })

    # Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click( ->
        $('.navbar-toggle:visible').click();
    );

  handleClick: -> $('*').blur()

  render:->
    <div id="navbar-main">
      <div className="navbar navbar-default navbar-fixed-top">
        <div className="container">
          <div className="navbar-header">
            <button type="button" className="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span className="icon-bar"></span> <span className="icon-bar"></span> <span className="icon-bar"></span> </button>
            <a className="smoothScroll navbar-brand" href="#home"> <i>Eyeberry</i></a> </div>
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

Home = React.createClass
  render: ->
    <div id="headerwrap" name="home" className="table y100">
      <div className="table-cell py4">
        <header>
          <h1>Pursuing the perfection? We do too.</h1>
          <p>Design, Developement, Delivery, every link surprised you.</p>
          <a href="#services" className="smoothScroll btn btn-lg">Find Out More</a>
        </header>
      </div>
    </div>

About = React.createClass
  render: ->
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

Service = React.createClass
  render: ->
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
            <div className="col-md-4 callout"> <i className="fa fa-desktop fa-3x" style={color:'#f5fbce'}></i>
              <h3>Design & Edit</h3>
              <p>Our designer offers the beautiful layout doucuments, whatever with or not your original design.
              </p>
            </div>
            <div className="col-md-4 callout"> <i className="fa fa-gears fa-3x" style={color:'#f5fbce'}></i>
              <h3>Development & Produce</h3>
              <p> Our factory is well-equipped enough to give you a satisfied delivery <br />date and ensure the quality of product.
              </p>
            </div>
            <div className="col-md-4 callout"> <i className="fa fa-dot-circle-o fa-3x" style={color:'#f5fbce'}></i>
              <h3>Delivery & Track</h3>
              <p>Our customer service will communicate with designer, factory, express delivery and so on, <br/>to deliver the product quickly and safely.
              </p>
            </div>
          </div>
        </div>

      </div>
    </div>

ModalCont = React.createClass
  componentDidMount: ->
    $(ReactDOM.findDOMNode this.refs.grid).bind 'contextmenu', (e) -> false

  initMasonry: ->
    grid = ReactDOM.findDOMNode this.refs.grid
    new Masonry grid,
      itemSelector: '.grid-item'
      # columnWidth: '.grid-item'
      # animationOptions:
      #   queue: true
      #   duration: 100

  render: ->
    body = []
    for i in [0..77]
      filename = printf "%05d.jpg", i
      body.push(
        <div key={i} className="col-md-4 col-sm-6 grid-item" onLoad={this.initMasonry}>
          <img className="img-responsive" style={borderRadius: 3} src="assets/img/gallery/#{filename}" alt="" />
        </div>
      )
    <div ref="grid">
      {body}
    </div>

Dossier = React.createClass
  getInitialState: ->
    inited: false

  componentDidMount: ->
    $('a.page-scroll').bind('click', (event) ->
        $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo')
        event.preventDefault()
    )

  handleClick: ->
    $('*').blur()

  openModal: (event) ->
    grid = this.refs[$(event.target).attr 'name']
    unless this.state.inited
      this.state.inited = true
      $(ReactDOM.findDOMNode grid).on 'shown.bs.modal', =>
        this.refs.galleryMasonry.initMasonry()
    grid.open()
  closeModal: (modal) ->
    this.refs[modal].close()

  render: ->
    modal1 = (
      <Modal
        ref="galleryModal"
        size = "modal-lg"
        color = "black"
        footer = "true"
        cancel = "close"
        onCancel = {this.closeModal.bind this, 'galleryModal'}
        title="">
        <ModalCont ref="galleryMasonry"/>
      </Modal>
    )
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
                        onClick={this.openModal}>More Details</a>
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

Team = React.createClass
  render: ->
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
              <h4>Lynn Lu</h4>
              <p>Customer Service Supervisor<br/></p>
              <a href="skype:vivianshan.eyeberry?chat"><i className="fa fa-skype"></i></a>
              <a href="mailto:lynnlu@eyeberryshanghai.com"><i className="fa fa-envelope"></i></a>
            </div>
            <div className="col-lg-8 col-lg-offset-2 centered" style={'marginBottom':'0'}>
              <p className="large" style={marginTop: 20, marginBottom:0}>
                The team of us is young but professional, <br/>and very pleased to meet you.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

Contact = React.createClass
  render: ->
    <div id="contact" name="contact" className="table y100">
      <div className="table-cell py3">
        <div className="container">
          <div className="row">
            <h2 className="centered">Contact Us</h2>
            <hr/>
            <p className="large">
              Hello! If you're interested in working with us, please get in touch using the info below!<br/>And we will get back to you as soon as possible!
            </p>
            <div className="col-md-4 centered" style={paddingBottom:12}> <i className="fa fa-phone fa-2x"></i>
              <p style={marginBottom:0}> +8621 5980 0770<br/> +8621 5980 0771</p>
            </div>
            <div className="col-md-4" style={paddingBottom:12}> <i className="fa fa-envelope-o fa-2x"></i>
              <p style={marginBottom:0}>info@eyeberryshanghai.com<br/></p>
            </div>
            <div className="col-md-4" style={paddingBottom:12}> <i className="fa fa-map-marker fa-2x"></i>
              <p style={marginBottom:0}>Block 2, No. 69, Hua Fang Road<br/>Qing Pu, Shanghai, China 201700</p>
            </div>
          </div>
        </div>
        <hr/>
        <p style={marginBottom:0}>&copy; 2016 Eyeberry Shanghai<br/>designed by Lynch</p>
      </div>
    </div>

module.exports = React.createClass
  componentDidMount: ->
    if ua.firefox
      $(window).bind 'resize', ->
        eles = $('.y100').css 'height', '100vh'
      $(window).resize()
    if ua.edge
      eles = $('hr').css 'left', 0

    $(ReactDOM.findDOMNode this.refs.body).fadeIn 1200
  render: ->
    <div ref="body" style={display: 'none'}>
      <Navbar />
      <Home />
      <About />
      <Service />
      <Dossier />
      <Team />
      <Contact />
    </div>
