class AffiliationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.present? && Affiliation.where(user: user, federation_id: record.federation_id) == []
  end
end
