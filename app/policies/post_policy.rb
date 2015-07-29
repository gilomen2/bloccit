class PostPolicy < ApplicationPolicy
  def index?
    true
  end


  class Scope < Scope
    def resolve
      if !user
        raise Pundit::NotAuthorizedError, "Must be logged in to view posts"
      elsif user.admin? || user.moderator?
        scope.all
      else
        scope.where(:user => user)
      end
    end
  end

end
