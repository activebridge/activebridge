#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require tinymce-jquery

$(document).on 'page:load ready', ->
  tinyMCE.init
    plugins: [
      'media advlist autolink lists link image'
      'charmap print preview anchor searchreplace visualblocks uploadimage'
      'code fullscreen autoresize insertdatetime media table contextmenu paste'
    ]
    toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright | bullist | numlist | link | media | code | uploadimage'
    selector: 'textarea.tinymce'
    width: '80%'
    menubar: false
  return
