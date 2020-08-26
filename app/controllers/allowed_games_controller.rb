class AllowedGamesController < ApplicationController
  
  def create
    @game = Game.find(params[:game_id])
    @kid = Kid.find(params[:kid_id])
    @allowed_game = AllowedGame.new(game: @game, kid: @kid)
    if @allowed_game.save
      redirect_to games_path, notice: "Game was added to the list"
    else
      redirect_to games_path, notice: "Game wasn't added to the list"
    end
  end
end
