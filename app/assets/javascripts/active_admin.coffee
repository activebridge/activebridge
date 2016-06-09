#= require jquery
#= require jquery_ujs
#= require simplemde.min
#= require turbolinks

$(document).on 'page:load ready', ->
  simplemde = new SimpleMDE({ element: document.getElementById('simplemde')[0] })
