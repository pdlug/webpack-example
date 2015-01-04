'use strict'

Backbone = require 'backbone'

# Base view providing some nice default functionality including template
# rendering and subview management.
module.exports = class BaseView extends Backbone.View
  # Template provided as a function, will be called with the contents of
  # `templateData` on render.
  template: null

  # Subviews associated with this view
  subviews: null

  constructor: (options) ->
    @subviews = []
    super

  # Register a subview (will be disposed of when this parent is removed)
  subview: (view) ->
    @subviews.push view

  # Data passed to the template function, defaults to the collection if set,
  # model otherwise. Override to provide a custom implementation.
  templateData: ->
    if @collection
      @collection
    else if @model
      @model.attributes
    else
      {}

  # Render a template using the `template` function and insert the result into
  # the current element.
  renderTemplate: ->
    @el.innerHTML = @template(@templateData())
    @

  # Render using a template if specified
  render: ->
    super
    @renderTemplate() if @template
    @

  # Remove the view and any associated subviews
  remove: ->
    _.each @subviews, (view) -> view.remove()
    super