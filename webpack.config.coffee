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
    publicPath: 'http://localhost:8080/scripts/'
    path: __dirname + '/dist/scripts'
    filename: 'bundle.js'

  devServer:
    headers:
      'Access-Control-Allow-Origin': '*'

  resolve:
    alias:
      'jquery.ui.widget': 'jquery.ui.widget/jquery.ui.widget.js'

    modules: [
        'node_modules'
        'assets/src'
    ]
    extensions: ['*', '.js', '.jsx', '.cjsx', '.coffee']

  cache: true
  devtool: false
  entry: [
    'webpack-dev-server/client?http://0.0.0.0:8080'
    './index.cjsx'
  ]
  plugins: [
    new webpack.DefinePlugin 'process.env.NODE_ENV': JSON.stringify 'development'
    new webpack.HotModuleReplacementPlugin()
    new webpack.LoaderOptionsPlugin
      debug: true
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
