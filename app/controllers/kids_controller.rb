class KidsController < ApplicationController
  before_action :set_kid, only: [:edit, :show, :update, :profile]
  before_action :set_allowed_games, only: [:profile, :show]
  
  def show
    redirect_to profile_path(current_user) if @kid.nil? 
    @subjects = %w[Maths English Biology Science]
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
    @kid.user = current_user
    if @kid.save
      redirect_to profile_path(current_user)
    else 
      render :new
    end
  end
  
  def profile
    update_level
  end

  def update_score
    @kid = Kid.find(params[:kid_id])
    @game = Game.find(params[:game_id])
    @kid.total_score = 0 if @kid.total_score.nil?
    @kid.total_score += @game.base_score
    @kid.save
    redirect_to kids_profile_path(@kid)
  end

  def update_level
    @kid = Kid.find(params[:id])
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
    params.require(:kid).permit(:age, :first_name, :last_name, :photo)
  end
  
  def set_kid
    @kid = Kid.find(params[:id])
  end
  
  def set_allowed_games
    @allowed_games = @kid.allowed_games
  end
end
