
import React from 'react';
import ReactDOM from 'react-dom';

// (window != window.top ? window.top : window).React = React;
import jQuery from 'jquery';
window.jQuery = jQuery;
window.$ = jQuery;

import UAParser from 'ua-parser-js';
window.ua = (new UAParser()).getResult();
ua.firefox = ua.browser.name == 'Firefox';
ua.edge = ua.browser.name == 'Edge';

import LazyLoader from 'LazyLoader';

ReactDOM.render(
  <LazyLoader componentToBeLoaded={() => System.import('main_page')} />,
  document.getElementById('content')
);
