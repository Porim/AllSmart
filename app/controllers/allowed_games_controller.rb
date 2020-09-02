class AllowedGamesController < ApplicationController
  
  def create
    @game = Game.find(params[:format])
    @kid = Kid.find(params[:kid_id])
    subject = params[:subject].nil? ? 'All' : params[:subject]
    if @kid.allowed_games.find_by(game_id: @game.id).present?
      redirect_to games_path(subject: subject, anchor: "record-#{@game.id}"), notice: "Game is already added"
    else
      @allowed_game = AllowedGame.new(game: @game, kid: @kid)
      @allowed_game.save
        if @allowed_game.save
          redirect_to games_path(subject: subject, anchor: "record-#{@game.id}"), notice: "Game was added to the list"
        else
          redirect_to all_games_path(subject: subject, anchor: "record-#{@game.id}"), notice: "Game wasn't added to the list"
        end
    end
  end

  def destroy
    @allowed_game = AllowedGame.find(params[:id])
    @kid = @allowed_game.kid
    @allowed_game.destroy
    redirect_to kid_path(@kid)
    # if AllowedGame.exists?(id: params[:id].to_i - 1)
    #   redirect_to kid_path(anchor: "allowed-game-#{@allowed_game.id - 1}")
    # elsif AllowedGame.exists?(id: params[:id].to_i + 1)
    #    redirect_to kid_path(anchor: "added-game-#{@allowed_game.id + 1}")
    # else
    #   redirect_to kid_path(@kid)
    # end
  end
end
