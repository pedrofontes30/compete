class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :email, :first_name, :last_name, :date_of_birth, :nationality, :gender
  has_many :affiliations
  has_many :registrations
  has_many :competition_divisions, through: :registrations
  has_one_attached :photo

  def win_count
    Heat.where(user: self).select { |heat| heat.heat_users.length > 1 }.count
  end

  def loss_count
    [(Heat.all.select { |heat| heat.heat_users.length > 1 && heat.heat_users.include?(self) }.count - win_count), 0].max
  end

  def age
    (Date.today - date_of_birth).to_i / 365
  end
end
