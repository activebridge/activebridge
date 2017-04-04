#= require jquery
#= require jquery_ujs
#= require simplemde.min
#= require turbolinks

$(document).on 'page:load ready', ->
  simplemde = document.getElementById('simplemde')
  new SimpleMDE({ element: simplemde[0] }) if simplemde
