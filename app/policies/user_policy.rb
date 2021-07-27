class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def edit?
    admin_or_user
  end

  def update?
    admin_or_user
  end

  def destroy?
    admin_or_user
  end

  private
  def admin_or_user
    @user.admin? || @user == @record
  end
end
