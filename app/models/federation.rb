class Federation < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :email, :name, :location, :affiliation_price

  has_many :affiliations
  has_many :competitions
  has_one_attached :photo
end
