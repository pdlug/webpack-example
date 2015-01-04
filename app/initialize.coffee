'use strict'

window.jQuery = $ = require 'jquery'

# Load foundation components we're using (installs itself as window.Foundation)
require 'foundation/js/foundation/foundation'
require 'foundation/js/foundation/foundation.reveal'

Application  = require 'application'

$ ->
  app = new Application el: document.getElementById('main')
  app.start()
  $(document).foundation()
