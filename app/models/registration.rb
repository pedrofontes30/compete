class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :competition_division
end
