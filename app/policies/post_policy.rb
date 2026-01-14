class PostPolicy < ApplicationPolicy
  # REQUIRED: Scope class (Pundit calls this automatically)
  class Scope < Scope
    def resolve
      scope.all   # Everyone can see all posts
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (record.user == user || user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end