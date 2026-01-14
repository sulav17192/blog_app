class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all 
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
  user.present? && (user.author? || user.admin?)
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