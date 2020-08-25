class KidsController < ApplicationController
  before_action :set_kid, only: [:edit, :show, :update]
  
  def show
    redirect_to profile_path(current_user) if @kid.nil? 
  end
  
  def edit
  end
  
  def update
    if @kid.update(kid_params)
      redirect_to kid_path(@kid)
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
  
  private
  
  def kid_params
  params.require(:kid).permit(:age, :first_name, :last_name)
  end
  
  def set_kid
    @kid = Kid.find(params[:id]) 
  end
  
end
