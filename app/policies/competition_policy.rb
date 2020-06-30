class CompetitionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def create?
    user.is_a? Federation
  end

  def index?
    true
  end

  def show?
    true
  end
end