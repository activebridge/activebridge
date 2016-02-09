<% cache params[:page] do %>
$(document).ajaxStart(->
  $('.loader-popup').show()
).ajaxStop ->
  $('.loader-popup').hide()
$.lazybox("<%= j(render partial: params[:page]) %>")
<% end %>
dataLayer.push { 'event': '<%= params[:page] %>' }
