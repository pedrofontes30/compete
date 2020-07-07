class Affiliation < ApplicationRecord
  belongs_to :user
  belongs_to :federation

  def days_since_registration
    (Time.now - created_at).to_i / 1.day
  end
end
