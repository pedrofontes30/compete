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
    user.present? && Affiliation.where(user: user, federation: record.competition_division.competition.federation) != [] && Registration.where(user: user, competition_division: record.competition_division) == [] && record.competition.registration_deadline > Date.today
  end
end
