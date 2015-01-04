'use strict'

path = require 'path'
webpack = require 'webpack'

commonsPlugin = webpack.optimize.CommonsChunkPlugin

module.exports =

  cache: true

  entry:
    app: './app/initialize.coffee'
    head: './app/head.coffee'

    admin: './app/admin/initialize.coffee'
    adminHead: './app/admin/head.coffee'

  output:
    path: path.join(__dirname, 'public')
    filename: 'javascripts/[name].js'
    chunkFilename: 'javascripts/[chunkhash].js'

  module:
    loaders: [
      {
        test: /\.coffee$/
        loader: 'coffee-loader'
      }
      {
        test: /\.scss$/
        loader: "style!css!sass?outputStyle=expanded&" +
          "includePaths[]=" +
            (path.resolve(__dirname, "./bower_components")) + "&" +
          "includePaths[]=" +
            (path.resolve(__dirname, "./bower_components/foundation/scss/")) + "&" +
          "includePaths[]=" +
            (path.resolve(__dirname, "./node_modules"))
      }
      {
        # required to write 'require('./style.css')'
        test: /\.css$/
        loader: 'style-loader!css-loader'
      }
      {
        test: /\.(handlebars|hbs)$/
        loader: 'handlebars-loader'
      }
    ]

  resolve:
    root: path.join(__dirname, 'app')

    alias:
      # replace backbones underscore dependency with lodash
      'underscore': path.join(__dirname, 'node_modules', 'lodash', 'dist', 'lodash.compat.js')

    extensions: [
      ''
      '.coffee'
      '.css'
      '.handlebars'
      '.hbs'
      '.js'
      '.scss'
      '.web.js'
      '.webpack.js'
    ]

    modulesDirectories: [
      'app'
      'bower_components'
      'node_modules'
    ]

  plugins: [
    # extract common chunks from the 'app' and 'admin' entries into 'common.js'
    new commonsPlugin('javascripts/common.js', ['app', 'admin'])
  ]
