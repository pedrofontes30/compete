class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :email, :first_name, :last_name, :date_of_birth, :nationality, :gender
  has_many :affiliations
  has_many :registrations
  has_many :competition_divisions, through: :registrations
  # has_one_attached :photo
end
