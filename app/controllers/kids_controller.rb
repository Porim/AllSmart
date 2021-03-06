class KidsController < ApplicationController
  before_action :set_kid, except: [:new, :create]
  before_action :set_allowed_games, only: [:profile, :show]
  
  def show
    @kid = Kid.find(params[:id])
    redirect_to profile_path(current_user) if @kid.nil? 
  end
  
  def edit
  end
  
  def update
    if @kid.update(kid_params)
      redirect_to profile_path(current_user)
    else
      render :edit
    end
  end
  
  def new
    @kid = Kid.new
  end
  
  def create
    @kid = Kid.new(kid_params)
    # this line is neccessary in order to pass validation
    @kid.user = current_user 
    if @kid.save
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end
  
  def destroy
    @kid.destroy
    redirect_to profile_path(current_user)
  end
  
  def profile
    update_level
  end
  # this method is updating child's score once game is played. 
  # Every attempt awards 20 points, once 60 are reached, child's 
  # level is incremented by update_level method.
  def update_score
    @game = Game.find(params[:game_id])
    @kid.total_score = 0 if @kid.total_score.nil?
    @kid.total_score += @game.base_score
    @kid.save
    redirect_to kid_profile_path(@kid)
  end

  def update_level
    @kid.level = 1 if @kid.level.nil?
    @kid.total_score = 0 if @kid.total_score.nil?
    if @kid.total_score >= 60
      @kid.level += 1
      @kid.total_score -= 60
    end
    @kid.save
  end

  private
  
  def kid_params
    params.require(:kid).permit(:age, :first_name, :last_name, :photo, :avatar_key)
  end
  
  def set_kid
    @kid = params[:kid_id].present? ? Kid.find(params[:kid_id]) : Kid.find(params[:id])
  end
  
  def set_allowed_games
    @allowed_games = @kid.allowed_games.includes(:game)
  end
end
