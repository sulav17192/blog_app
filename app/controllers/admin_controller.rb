class AdminController < ApplicationController
  before_action :require_admin

  def dashboard

    authorize :admin_dashboard, :dashboard?

    @users = User.all.order(created_at: :desc)
    # @total_posts = Post.count
    # @total_users = User.count
  end

  private

  def require_admin
    unless current_user&.admin?
      flash[:alert] = "Admin access only."
      redirect_to root_path
    end
  end
end