#
# Webpack production server configuration
#
# This file is set up for serving the webpak, which will pack every sources for priduction.
#

'use strict'

webpack = require 'webpack'

webpackConfig =
  context: __dirname
  output:
    publicPath: '/assets/'
    path: __dirname + "/assets/"
    filename: "scripts.js"

  resolve:
    alias:
      'jquery.ui.widget': "jquery.ui.widget/jquery.ui.widget.js"

    modulesDirectories: [
        'node_modules'
        'assets/src'
    ]
    extensions: ['', '.js', '.jsx', '.cjsx', '.coffee']

  cache: false
  debug: false
  devtool: false
  entry: [
    './index.cjsx'
  ]
  plugins: [
    new webpack.optimize.UglifyJsPlugin compress: warnings: false
    new webpack.DefinePlugin 'process.env.NODE_ENV': '"production"'
  ]
  stats:
    colors: true
    reasons: true

  module:
    loaders: [
      {
        test: /\.css$/
        loader: 'style!css'
      },{
        test: /\.sass$/
        loaders: ["style", "css", "sass?indentedSyntax"]
      }, {
        test: /\.gif/
        loader: 'url-loader?limit=131072&minetype=image/gif'
      }, {
        test: /\.jpg/
        loader: 'url-loader?limit=131072&minetype=image/jpg'
      }, {
        test: /\.png/
        loader: 'url-loader?limit=131072&minetype=image/png'
      },
      {
        test: /\.cjsx$/,
        loaders: ['coffee', 'cjsx']
      },
      {
        test: /\.coffee$/,
        loader: 'coffee'
      },
      {
        test: /\.(woff|woff2)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "url-loader?limit=10000&minetype=application/font-woff"
      },
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "file-loader"
      },
      {
        test: /\.(png|woff|woff2|eot|ttf|svg)$/,
        loader: 'url-loader?limit=100000'
      }
    ]

module.exports = webpackConfig
