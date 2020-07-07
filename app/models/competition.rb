  class Competition < ApplicationRecord
    belongs_to :federation
    has_many :competition_divisions
    has_many :registrations, through: :competition_divisions

    has_one_attached :photo

    validates_presence_of :name, :address, :date, :description, :registration_deadline, :registration_price

    accepts_nested_attributes_for :competition_divisions, allow_destroy: true, reject_if: :all_blank

    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
    reverse_geocoded_by :latitude, :longitude do |obj, results|


      if geo = results.first
        obj.city = geo.city
      end
    end
    after_validation :reverse_geocode
    def check_registered?(user)
      registrations.each do |registration|
       return true if registration.user == user
     end
     false
   end
 end
