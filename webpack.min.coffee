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
    publicPath: '/assets/dist/'
    path: __dirname + "/assets/dist/"
    filename: "scripts.js"

  resolve:
    alias:
      'jquery.ui.widget': "jquery.ui.widget/jquery.ui.widget.js"

    modules: [
        'node_modules'
        'assets/src'
    ]
    extensions: ['*', '.js', '.jsx', '.cjsx', '.coffee']

  cache: false
  devtool: false
  entry: [
    './index.cjsx'
  ]
  plugins: [
    new webpack.DefinePlugin 'process.env.NODE_ENV': JSON.stringify 'production'
    new webpack.optimize.UglifyJsPlugin compress: warnings: false
    new webpack.LoaderOptionsPlugin debug: false
  ]
  stats:
    colors: true
    reasons: true

  module:
    rules: [
      {
        test: /\.css$/
        use: ['style-loader', 'css-loader']
      },{
        test: /\.sass$/
        use: ['style-loader', 'css-loader', 'sass-loader?indentedSyntax']
      }, {
        test: /\.gif/
        use: ['url-loader?limit=100000&minetype=image/gif']
      }, {
        test: /\.jpg/
        use: ['url-loader?limit=100000&minetype=image/jpg']
      }, {
        test: /\.png/
        use: ['url-loader?limit=100000&minetype=image/png']
      },
      {
        test: /\.cjsx$/,
        use: ['coffee-loader', 'cjsx-loader']
      },
      {
        test: /\.coffee$/,
        use: ['coffee-loader']
      },
      {
        test: /\.(woff|woff2)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        use: ['url-loader?limit=10000&mimetype=application/font-woff']
      },
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        use: ['file-loader']
      }
    ]

module.exports = webpackConfig
