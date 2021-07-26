class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @model = model
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
    @current_user.admin? || @current_user == @model
  end
end
