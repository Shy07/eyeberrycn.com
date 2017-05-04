#
# Webpack development server configuration
#
# This file is set up for serving the webpak-dev-server, which will watch for changes and recompile as required if
# the subfolder /webpack-dev-server/ is visited. Visiting the root will not automatically reload.
#

'use strict'

webpack = require 'webpack'

webpackConfig =
  context: __dirname
  output:
    publicPath: "http://localhost:8080/scripts/"
    path: __dirname + "/dist/scripts"
    filename: "bundle.js"

  resolve:
    alias:
      'jquery.ui.widget': "jquery.ui.widget/jquery.ui.widget.js"

    modulesDirectories: [
        'node_modules'
        'assets/src'
    ]
    extensions: ['', '.js', '.jsx', '.cjsx', '.coffee']

  cache: true
  debug: true
  devtool: false
  entry: [
    "webpack-dev-server/client?http://0.0.0.0:8080"
    './index.cjsx'
  ]
  plugins: [
    new webpack.DefinePlugin 'process.env.NODE_ENV': '"development"'
    new webpack.HotModuleReplacementPlugin()
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
        loader: 'url-loader?limit=100000&minetype=image/gif'
      }, {
        test: /\.jpg/
        loader: 'url-loader?limit=100000&minetype=image/jpg'
      }, {
        test: /\.png/
        loader: 'url-loader?limit=100000&minetype=image/png'
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
