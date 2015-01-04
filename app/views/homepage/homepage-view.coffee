'use strict'

Base              = require 'views/base/view'
PhotoCarouselView = require './photo-carousel-view'

module.exports = class HomepageView extends Base
  template: require './templates/index'

  render: ->
    super
    photosView = new PhotoCarouselView
                  collection: @collection
                  el: @el.querySelector('#photos')

    @subview photosView.render()
    @
