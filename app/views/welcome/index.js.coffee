<% cache params[:page] do %>
  $.lazybox("<%= j(render partial: params[:page]) %>")
<% end %>
