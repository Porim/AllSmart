class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo])
  end

  def after_sign_in_path_for(resource)
    profile_path(current_user)
  end

  def after_sign_up_path_for(resource)
    profile_path(current_user)
  end

  def default_url_options
    { host: ENV["www.allsmart.uk"] || "localhost:3000" }
  end
end
