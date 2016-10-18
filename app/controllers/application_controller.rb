class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    # Allow additional fields in Devise auth forms
    def configure_permitted_parameters
      # Devise sign up form:
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :permission])
    end

end
