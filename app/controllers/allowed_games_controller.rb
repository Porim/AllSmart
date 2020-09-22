class AllowedGamesController < ApplicationController
  before_action :set_kid, only: [:create, :destroy]
  # if subject is nil, after creation of allowed game user stays at 
  # the same location of the page in All Games tab - this is insured 
  # by the anchor. Else, user stays on the same location of the 
  # page, but on the corresponding tab, rather than All Games tab.
  def create
    @game = Game.find(params[:format])
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
    # checking if games which were created before current game exist
    kid_games = @kid.allowed_games.where("created_at > ?", @allowed_game.created_at)
    if kid_games.empty?
      # if earlier created games exit, arrange them in descending 
      # order to find the the most recent one.
      @existing_games = @kid.allowed_games.where("created_at < ?", @allowed_game.created_at).order('created_at DESC').limit(1)
    else
      # if such games do not exist, check for the games which were 
      # created after current game and arrange in ASC to find the 
      # most recent one
      @existing_games = kid_games.order('created_at ASC').limit(1)
    end
    @kid = Kid.find(params[:kid_id])
    @allowed_game.destroy
    # if only one game is left in child profile, @existing_games array # will be empty. In this case we redirect to @kid (anchor is nil),
    # else to @kid with anchor given by first entry of @existing_games.
    game_anchor = @existing_games.first.nil? ? nil : "allowed-game-#{@existing_games.first.id}"
    redirect_to kid_path(@kid, anchor: game_anchor) 
  end
  
  private
  
  def set_kid
    @kid = Kid.find(params[:kid_id])
  end
end
