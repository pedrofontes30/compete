class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :competition_division
  belongs_to :position

  def competition
    competition_division.competition
  end
end
