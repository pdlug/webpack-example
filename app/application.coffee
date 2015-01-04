'use strict'

Photos          = require 'models/photos'

HomepageView    = require 'views/homepage/homepage-view'
NotFoundView    = require 'views/not-found/not-found-view'
PhotoView       = require 'views/photo-view/photo-view'

BaseApplication = require 'base/application'

module.exports = class Application extends BaseApplication
  routes:
    '': 'index'
    'photos/:id': 'photo'
    '*notFound': 'notFound'

  constructor: (args) ->
    super
    data = require 'json!./data/photos.json'
    @photos = new Photos data

  notFound: =>
    @currentView new NotFoundView

  photo: (id) =>
    @currentView new PhotoView model: @photos.get(id)

  index: =>
    @currentView new HomepageView collection: @photos
