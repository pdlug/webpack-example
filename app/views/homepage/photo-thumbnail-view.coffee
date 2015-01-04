'use strict'

Base = require 'views/base/view'

module.exports = class PhotoThumbnailView extends Base
  template: require './templates/photo'

  tagName: 'li'
