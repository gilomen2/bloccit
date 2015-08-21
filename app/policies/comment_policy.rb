class CommentPolicy < ApplicationPolicy
  def destroy?
    user.present? && ( record.user == user || user.admin? || user.moderator? )
  def create?
    user.present?
  end
  def new?
    user.present?
  end
end
