'use strict'

Backbone = require 'backbone'

# A view implementation that renders all items in a collection given individual
# views accepting each model in the collection. This implementation subclasses
# `Backbone.View` so the standard options there apply (e.g. either provide a
# containg `el` or specify `tagName` and other options to generate a container).
#
# Example:
#
# class ListView extends CollectionView
#   itemView: ListItemView
#   tagName: 'li'
#
module.exports = class CollectionView extends Backbone.View
  # View class to wrap each item in the collection with
  itemView: null

  # Subview tracking to ensure all item views are cleaned up on remove
  subviews: null

  constructor: (options) ->
    @subviews = []
    super

  render: ->
    super
    @collection.each (model) => @addItem model
    @

  # Create a view for an item and add it to the collection view
  addItem: (model) ->
    view = new @itemView model: model
    @subviews.push view
    @el.appendChild view.render().el

  remove: ->
    _.each @subviews, (view) -> view.remove()
    super