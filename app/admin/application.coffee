'use strict'

Photos          = require 'models/photos'

AdminHomeView   = require 'admin/views/home-view/home-view'
NotFoundView    = require 'views/not-found/not-found-view'

BaseApplication = require 'base/application'

module.exports = class AdminApplication extends BaseApplication
  routes:
    '': 'index'
    '*notFound': 'notFound'

  constructor: (args) ->
    super
    data = require 'json!data/photos.json'
    @photos = new Photos data

  notFound: =>
    @currentView new NotFoundView

  index: =>
    @currentView new AdminHomeView collection: @photos
