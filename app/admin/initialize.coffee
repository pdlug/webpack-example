'use strict'

window.jQuery = $ = require 'jquery'

# Load foundation components we're using (installs itself as window.Foundation)
require 'foundation/js/foundation/foundation'
require 'foundation/js/foundation/foundation.reveal'

AdminApplication  = require 'admin/application'

$ ->
  app = new AdminApplication el: document.getElementById('main'), root: '/admin/'
  app.start()
  $(document).foundation()
