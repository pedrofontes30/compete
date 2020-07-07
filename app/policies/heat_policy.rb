class HeatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record.competition_division.competition.federation == user
  end
end
