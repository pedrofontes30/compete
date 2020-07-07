class Heat < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :competition_division
  has_many :heat_users, dependent: :destroy
end
