class HeatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    true
  end
end
# record.competition_division.competition.federation == user
