class Competition < ApplicationRecord
  belongs_to :federation
  has_many :competition_divisions
  accepts_nested_attributes_for :competition_divisions, allow_destroy: true, reject_if: :all_blank
end
