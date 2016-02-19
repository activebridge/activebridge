#= require jquery
#= require jquery_ujs
#= require simplemde.min
#= require turbolinks
#= require bootstrap-sprockets
#= require google_tag_manager
#= require jquery.remotipart

Turbolinks.enableProgressBar()
Turbolinks.enableTransitionCache()

$(document).on 'page:change', ->
  simplemde = new SimpleMDE({ element: document.getElementById('simplemde') })
