'use strict'

$            = require 'jquery'
_            = require 'underscore'
Backbone     = require 'backbone'

# BaseApplication provides routing and application level view management.
# Individual applications just need to subclass this providing routes and their
# implementation. An application wide event handler is registered to route all
# links with internal URLs.
#
# Example:
#
# class MyApp extends BaseApplication
#   routes:
#     '': 'index'
#
#   index: ->
#     @currentView new MyView
#
module.exports = class BaseApplication extends Backbone.Router
  constructor: (args) ->
    super
    {@el, @root} = args

    $(@el).on 'click', 'a', @link

  start: ->
    options = pushState: true
    options.root = @root if @root?

    Backbone.history.start options

  # Set current primary view, removes the previous one (if any)
  currentView: (view) =>
    @curView.remove() if @curView

    @el.appendChild view.render().el
    @curView = view

  # Handle link clicks within the application using the router.
  link: (e) =>
    target = e.currentTarget || e.delegateTarget
    loc = target.getAttribute('href')

    # only route relative links
    if loc && !loc.match(/^\/\//) && !loc.match(/:\/\//)
      e.preventDefault()
      @navigate loc, trigger: true

    @