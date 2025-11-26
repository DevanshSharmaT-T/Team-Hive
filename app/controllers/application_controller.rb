class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Devise::Controllers::Helpers
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :job_title])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :job_title])
  end
end
  