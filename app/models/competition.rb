class Competition < ApplicationRecord
  belongs_to :federation
  has_many :competition_divisions
  has_many :registrations, through: :competition_divisions

  has_one_attached :photo

  validates_presence_of :name, :address, :date, :description, :registration_deadline, :registration_price

  accepts_nested_attributes_for :competition_divisions, allow_destroy: true, reject_if: :all_blank

  # def start_time
  #    date.start ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  # end
end
