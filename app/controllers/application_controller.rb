class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in,
                                      keys: %i[login password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email password_confirmation current_password])
  end
end
