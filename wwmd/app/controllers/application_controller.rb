class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :sucess, :warning, :danger, :info

  # strong parameters to protect database while at the same time allowing for updates
  # referencing built in methods
  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me, :photo])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :email, :password, :password_confirmation, :remember_me])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password, :photo])
  end

end

