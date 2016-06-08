#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require tinymce-jquery

$(document).on 'page:load ready', ->
  tinyMCE.init
    plugins: [
      'media advlist autolink lists link image textcolor colorpicker codesample'
      'charmap print preview anchor searchreplace visualblocks uploadimage'
      'code fullscreen autoresize insertdatetime media table contextmenu paste'
    ]
    toolbar: 'undo redo | forecolor backcolor | bold italic | alignleft aligncenter alignright | bullist | numlist | link | media | codesample | uploadimage'
    selector: 'textarea.tinymce'
    width: '80%'
  return
