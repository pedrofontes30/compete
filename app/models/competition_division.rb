class CompetitionDivision < ApplicationRecord
  belongs_to :competition
  belongs_to :division

  def select_label
    division.name
  end
end
