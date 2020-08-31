class GamesController < ApplicationController
  def index
    if params[:subject] == 'Biology'
      @game_title = "Human Biology"
      @biology = 1
    elsif params[:subject] == 'All'
      @game_title = "All Games"
      @all = 1
    elsif params[:subject] == 'Maths'
      @game_title = params[:subject]
      @maths = 1
    elsif params[:subject] == 'English'
      @game_title = 'English'
      @english = 1
    else
      @game_title = params[:subject]
      @science = 1
    end
    
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
end
