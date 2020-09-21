class AllowedGamesController < ApplicationController
  before_action :set_kid, only: [:create, :destroy]
  #if subject is nil, after creation of allowed game user stays at the same location of the page in All Games tab - this is insured by the anchor. Else, user stays on the same location of the page, but on the corresponding tab, rather than All Games tab.
  def create
    @game = Game.find(params[:format])
    @delete_redirect = []
    subject = params[:subject].nil? ? 'All' : params[:subject]
    if @kid.allowed_games.find_by(game_id: @game.id).present?
      redirect_to games_path(subject: subject, anchor: "record-#{@game.id}"), notice: "Game is already added"
    else
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
    kid_games = @kid.allowed_games.where("created_at > ?", @allowed_game.created_at).empty?
    @allowed_games = kid_games ? @kid.allowed_games.where("created_at < ?", @allowed_game.created_at).order('created_at DESC') : @kid.allowed_games.where("created_at > ?", @allowed_game.created_at).order('created_at ASC')
    @kid = Kid.find(params[:kid_id])
    @allowed_game.destroy
    redirect_to kid_path(@kid, anchor: "allowed-game-#{@allowed_games.first.id}")
  end
  
  private
  
  def set_kid
    @kid = Kid.find(params[:kid_id])
  end
end
