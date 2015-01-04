'use strict'

CollectionView     = require 'views/base/collection-view'
PhotoThumbnailView = require './photo-thumbnail-view'

module.exports = class PhotoCarouselView extends CollectionView
  itemView: PhotoThumbnailView
