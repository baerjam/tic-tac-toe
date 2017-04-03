<% if @game.errors.any? %>
  
<% else %>
$('#board').replaceWith("<%= j render  'board', game: @game %>")
<% end %>
