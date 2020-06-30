class Competition < ApplicationRecord
  belongs_to :federation
  has_many :comptition_divisions
  accepts_nested_attributes_for :comptition_divisions, allow_destroy: true, reject_if: :all_blank
end
