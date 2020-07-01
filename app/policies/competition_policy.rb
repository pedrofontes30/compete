class CompetitionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    raise
    user.is_a? Federation
  end

  def show?
    true
  end

  def update?
    # user may be federation
    record.federation == user
  end

  def destroy?
    # user may be federation
    record.federation == user
  end
end
