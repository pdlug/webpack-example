'use strict'

gulp             = require('gulp')
gutil            = require('gulp-util')
webpack          = require 'webpack'
webpackConfig    = require './webpack.config.coffee'
WebpackDevServer = require 'webpack-dev-server'

publicPath = 'public'

# Default task: start a dev server and watch for changes
gulp.task 'default', ['watch']

# Dev builds of assets with source maps and debug enabled
gulp.task 'build-dev', ['copy-assets', 'webpack:build-dev']

# Production-ready builds of our assets
gulp.task 'build', ['copy-assets', 'webpack:build']

# Copy assets and start a webpack dev server: http://localhost:8080/
gulp.task 'watch', ['copy-assets', 'webpack:dev-server'], ->
  gulp.watch(['assets/**'], ['copy-assets'])

# Make a dev copy of the config w/ source maps and debug enabled
devConfig = Object.create webpackConfig
devConfig.devtool = 'source-map'
devConfig.debug = true

# Start a webpack dev server at: http://localhost:8080/
gulp.task 'webpack:dev-server', (callback) ->
  new WebpackDevServer webpack(devConfig),
    contentBase: publicPath
    stats:
      colors: true
  .listen 8080, 'localhost', (err) ->
    throw new gutil.PluginError('webpack-dev-server', err) if err
    gutil.log '[webpack-dev-server]', 'http://localhost:8080/webpack-dev-server/index.html'

gulp.task 'webpack:build-dev', (callback) ->
  webpack devConfig, (err, stats) ->
    throw new gutil.PluginError('webpack:build-dev', err) if err
    gutil.log '[webpack:build-dev]', stats.toString colors: true
    callback()

gulp.task 'webpack:build', (callback) ->
  conf = Object.create webpackConfig
  conf.plugins = conf.plugins.concat(
    new webpack.DefinePlugin 'process.env': { NODE_ENV: JSON.stringify('production') }
    new webpack.optimize.DedupePlugin()
    new webpack.optimize.UglifyJsPlugin()
  )

  webpack conf, (err, stats) ->
    throw new gutil.PluginError('webpack:build', err) if err
    gutil.log '[webpack:build]', stats.toString colors: true
    callback()

# Copy static assets to public directory
gulp.task 'copy-assets', ->
  gulp.src('assets/**')
    .pipe(gulp.dest('public'))
