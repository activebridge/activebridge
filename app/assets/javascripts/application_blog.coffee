#= require jquery
#= require bootstrap-sprockets
#= require jquery_ujs
#= require turbolinks
#= require tinymce
#= require ga_blog

tiniMCE = ->
  tinyMCE.editors = []
  tinyMCE.init
    plugins: [
      'media advlist autolink lists link image'
      'charmap print preview anchor searchreplace visualblocks uploadimage'
      'code fullscreen autoresize insertdatetime media table contextmenu paste'
    ]
    toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright | bullist | numlist | link | media | code | uploadimage'
    selector: 'textarea.tinymce'
    menubar: false
