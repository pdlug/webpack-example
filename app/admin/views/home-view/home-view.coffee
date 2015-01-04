'use strict'

Base             = require 'views/base/view'
PhotoManagerView = require './photo-manager-view'

module.exports = class AdminHomeView extends Base
  template: require './templates/index'

  render: ->
    super
    photosView = new PhotoManagerView
                  collection: @collection
                  el: @el.querySelector('#photos')

    @subview photosView.render()
    @