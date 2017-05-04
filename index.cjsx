# require 'rubyjs'

React = require 'react'
ReactDOM = require 'react-dom'

(if window != window.top then window.top else window).React = React
window.jQuery = require 'jquery'
window.$ = window.jQuery

UAParser = require 'ua-parser-js'
window.ua = (new UAParser()).getResult()
ua.firefox = ua.browser.name == 'Firefox'
ua.edge = ua.browser.name == 'Edge'

LazyLoader = require 'LazyLoader'

# MainPage = require 'main_page'
MainPage = LazyLoader require 'bundle?lazy!main_page'

ReactDOM.render(
  <MainPage />
  , document.getElementById 'content'
)

module.exports = {}
