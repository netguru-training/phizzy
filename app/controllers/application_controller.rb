class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:firstname, :lastname)
    devise_parameter_sanitizer.for(:account_update).push(:firstname, :lastname)
  end
end

