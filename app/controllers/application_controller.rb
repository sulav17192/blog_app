class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_keys = [:first_name, :last_name]
    # For sign up (registration)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For account update (edit profile)
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

def user_not_authorized(exception)
  policy_action = exception.query.to_s.gsub("?", "")

  message = case policy_action
            when "create", "new"
              "You need to be an author or admin to create new posts."
            when "edit", "update"
              "You can only edit your own posts (or be an admin)."
            when "destroy"
              "You can only delete your own posts (or be an admin)."
            else
              "Sorry, you're not allowed to do that."
            end

  flash[:alert] = message
  redirect_to(request.referrer || root_path)
end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
