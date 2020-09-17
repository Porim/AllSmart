class UsersController < ApplicationController
  before_action :set_user, :set_kids, only: [:profile]
  
  def profile
  end
  
  private
 
  def set_user
    @user = current_user
  end
  
  def set_kids
    @kids = @user.kids
  end
end
