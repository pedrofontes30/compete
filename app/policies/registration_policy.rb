class RegistrationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.present?
  end

  def create?
    user.present? && Registration.where(user: user, competition_division: record.competition_division) == []
  end
end
