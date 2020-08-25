class UsersController < ApplicationController
  def profile
    @user = current_user
    @kids = @user.kids
  end
end
