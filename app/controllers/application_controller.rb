class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_keys = [:first_name, :last_name]
    # For sign up (registration)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For account update (edit profile)
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
