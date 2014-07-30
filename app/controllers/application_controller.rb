class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_devise_params, if: :devise_controller?
  before_filter :authenticate_user!

  def authenticate_admin!
 	redirect_to new_user_session_path unless (user_signed_in? || current_user.is_admin? rescue false)
  end

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation,
               profile_attributes: [:first_name, :last_name, :website, :bio, :dob])
    end
  end
end
