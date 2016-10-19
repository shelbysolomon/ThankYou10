class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # Allow custom params in devise forms
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Use 'login' layout for all devise views
  layout :layout_by_resource, if: :devise_controller?

  protected

    # Allow additional fields in Devise auth forms
    def configure_permitted_parameters
      # Devise sign up form:
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :permission, company_attributes: [:name]])
    end

    def layout_by_resource
      if devise_controller?
        'login'
      else
        'application'
      end
    end

end
