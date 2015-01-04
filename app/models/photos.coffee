'use strict'

Collection = require './base/collection'
Photo      = require './photo'

module.exports = class Photos extends Collection
  model: Photo