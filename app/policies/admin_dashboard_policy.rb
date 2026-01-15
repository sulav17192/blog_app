class AdminDashboardPolicy < ApplicationPolicy
  # REQUIRED: Scope class (Pundit demands this even for headless policies)
  class Scope < Scope
    def resolve
      scope.all  # or scope.none - doesn't matter for headless
    end
  end

  def dashboard?
    user&.admin?
  end
end