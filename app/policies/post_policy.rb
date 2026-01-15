class PostPolicy < ApplicationPolicy
class Scope < Scope
    def resolve
      if user.nil? || user.reader?
        scope.where(status: 1)
      elsif user.author?
        scope.where("user_id = ? OR status = ?", user.id, 1)
      elsif user.admin?
        scope.all
      else
        scope.none
      end
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