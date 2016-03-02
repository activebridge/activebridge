#= require jquery
#= require jquery_ujs
#= require simplemde.min
#= require turbolinks
#= require jquery_ufujs
#= require google_tag_manager

Turbolinks.enableProgressBar()
Turbolinks.enableTransitionCache()

$(document).on 'page:change', ->
  simplemde = new SimpleMDE({ element: document.getElementById('simplemde') })
