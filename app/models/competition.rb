class Competition < ApplicationRecord
  belongs_to :federation
  has_many :competition_divisions
  has_many :registrations, through: :competition_divisions
  has_one_attached :photo

  accepts_nested_attributes_for :competition_divisions, allow_destroy: true, reject_if: :all_blank
end
