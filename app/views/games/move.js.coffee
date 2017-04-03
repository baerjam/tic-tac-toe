<% if @game.errors.any? %>
$('#messages').html("<%= j @game.errors.full_messages.join(', ') %>")
<% else %>
$('#board').replaceWith("<%= j render  'board', game: @game %>")
<% end %>
