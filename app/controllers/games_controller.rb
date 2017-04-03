class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new

    if @game.save
      save_game_to_session
      redirect_to :games_play
    else
      render :new, notice: 'Error creating game'
    end
  end

  def play
    @game = session[:game]
  end

  def show
    @game = session[:game]
  end

  def make_move
    @game = session[:game]

    unless @game.over?
      row, col = param_to_row_col(params[:space])

      @game.make_move(row, col)
      @game.switch_players unless @game.over?

      save_game_to_session
    end

    respond_to do |format|
      format.js { render :move }
    end
  end

  def destroy
    @game = Game.find(params[:id])

    if @game.destroy
      clear_game_in_session
      redirect_to root_url
    end
  end

  private

  def save_game_to_session
    session[:game] = @game
  end

  def clear_game_in_session
    session[:game] = nil
  end

  def param_to_row_col(space_param)
    space_param.split(':').map(&:to_i)
  end
end
