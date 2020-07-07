class UserFederationDivisionScore < ApplicationRecord
  belongs_to :user
  belongs_to :federation
  belongs_to :division
end
