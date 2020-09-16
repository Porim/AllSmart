class GamesController < ApplicationController
  def index

    @subject = params[:subject].nil? ? 'All' : params[:subject]
    @subjects = { 'Maths': 'medolwcf6nigmrl3cvev', 'Science': 'rnrgntaicfrllbnrzlxg', 'English': 'dkbxbzo5dpzzf0o3kbgy', 'Biology': 'enssmizahvyzkryyufw0' }
    @all_games = Game.all
    # if params[:subject] == 'Biology'
    #   @game_title = "Human Biology"
    #   @subject_image = 'enssmizahvyzkryyufw0'
    #   @biology = 1
    # elsif params[:subject] == 'All'
    #   @game_title = "All Games"
    #   @subject_image = 'uiprme0fpeh7am66dntp'
    #   @all = 1
    # elsif params[:subject] == 'Maths'
    #   @game_title = params[:subject]
    #   @subject_image = 'medolwcf6nigmrl3cvev'
    #   @maths = 1
    # elsif params[:subject] == 'English'
    #   @game_title = 'English'
    #   @subject_image = 'dkbxbzo5dpzzf0o3kbgy'
    #   @english = 1
    # else
    #   @game_title = params[:subject]
    #   @subject_image = 'rnrgntaicfrllbnrzlxg'
    #   @science = 1
    # end 
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
end
