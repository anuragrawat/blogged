class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_current_user

  def set_current_user
    User.current = current_user
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
