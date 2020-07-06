class HeatUser < ApplicationRecord
  belongs_to :user
  belongs_to :heat
end
