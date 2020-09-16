class GamesController < ApplicationController
  before_action :set_kid, :set_game, only: [:show]
  
  def index
    @subject = params[:subject].nil? ? 'All' : params[:subject]
    @subjects = { 'Maths': 'medolwcf6nigmrl3cvev', 'Science': 'rnrgntaicfrllbnrzlxg', 'English': 'dkbxbzo5dpzzf0o3kbgy', 'Biology': 'enssmizahvyzkryyufw0' }
    @all_games = Game.all
    if params[:subject].present?
      if params[:subject] == 'All'
      @games = Game.all
      else
      sql_query = " \
        games.title @@ :query \
        OR games.topic @@ :query \
        OR games.subject @@ :query \
      "
      @games = Game.where(sql_query, query: "%#{params[:subject]}%")
      end
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
    @kid = Kid.find(params[:kid_id])
  end
  
  private
 
  def set_kid
    @kid = Kid.find(params[:kid_id])
  end
  
  def set_game
    @game = Game.find(params[:id])
  end
end
