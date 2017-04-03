module GamesHelper
  def board_cell(marker, space_index)
    if marker.nil?
      link_to('', games_make_move_path(space: space_index), method: :patch, remote: true, class: '')
    else
      image_tag("markers/#{marker}", class: 'marker-icon')
    end
  end

  def players_turn?(player, current_player)
    content_tag(:span, "It's your turn!", class: "active-text") if player == current_player
  end
end
