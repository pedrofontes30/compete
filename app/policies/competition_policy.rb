class CompetitionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def update?
    # user may be federation
    # record.federation == user
    true
  end

  def edit?
    # record.federation == user
    true
  end

  def destroy?
    # user may be federation
    # record.federation == user
    true
  end
end
