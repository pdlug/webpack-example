'use strict'

CollectionView = require 'views/base/collection-view'
PhotoView      = require './photo-view'

module.exports = class PhotoManagerView extends CollectionView
  itemView: PhotoView
