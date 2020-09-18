class AllowedGamesController < ApplicationController
  
  def create
    @game = Game.find(params[:format])
    @kid = Kid.find(params[:kid_id])
    subject = params[:subject].nil? ? 'All' : params[:subject]
    # prevents user from adding the same game twice
    if @kid.allowed_games.find_by(game_id: @game.id).present?
      redirect_to games_path(subject: subject, anchor: "record-#{@game.id}"), notice: "Game is already added"
    else
      # Otherwise, creates a new game and keeps user at the same location on the page. This is determined based on subject key: if present, then card was added from one of the tabs, if nil, was added from AllGames tab. If save was not succesfull, gives Game wasnt added flash
      @allowed_game = AllowedGame.new(game: @game, kid: @kid)
      @allowed_game.save
      if @allowed_game.save
        redirect_to games_path(subject: subject, anchor: "record-#{@game.id}"), notice: "Game was added to the list"
      else
        redirect_to games_path(subject: subject, anchor: "record-#{@game.id}"), notice: "Game wasn't added to the list"
      end
    end
  end

  def destroy
    @allowed_game = AllowedGame.find(params[:id])
    @kid = @allowed_game.kid
    @allowed_game.destroy
    redirect_to kid_path(@kid)
  end
end
