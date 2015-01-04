'use strict'

Base = require 'views/base/view'

module.exports = class PhotoView extends Base
  template: require './templates/photo'
  tagName: 'div'
  className: 'photo-wrap'
