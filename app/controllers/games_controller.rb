class GamesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        games.title @@ :query \
        OR games.topic @@ :query \
        OR games.subject @@ :query \
      "
      @games = Game.where(sql_query, query: "%#{params[:query]}%")
    else
      @games = Game.all
    end
  end
end
