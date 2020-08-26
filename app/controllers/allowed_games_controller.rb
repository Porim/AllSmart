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

  def destroy
    @allowed_game = AllowedGame.find(params[:id])
    @kid = @allowed_game.kid
    @allowed_game.destroy
    redirect_to kid_path(@kid)
  end
end
