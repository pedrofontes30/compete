class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :competition_division
  belongs_to :position, optional: true

  def competition
    competition_division.competition
  end
end
