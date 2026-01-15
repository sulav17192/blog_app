class AdminController < ApplicationController
  before_action :require_admin

  def dashboard
  end

  private

  def require_admin
    unless current_user&.admin?
      flash[:alert] = "Admin access only."
      redirect_to root_path
    end
  end
end