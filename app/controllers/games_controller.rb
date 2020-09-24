class GamesController < ApplicationController
  before_action :set_kid, :set_game, only: [:show]  
  # @subjects is a hash containing cloudinary urls for images 
  # associated with subjects, passed as keys. @subject sets parameter # as 'All' if param[:subject] is empty, else it contains one of the # subjects,i.e Maths, English, Biology, etc. This determines content # of @games array which is rendered on corresponding tabs in the view.
  def index
    @user = current_user
    @kids = @user.kids
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
  end
  
  private
   
  def set_kid
    @kid = Kid.find(params[:kid_id])
  end
 
  def set_game
    @game = Game.find(params[:id])
  end
end
