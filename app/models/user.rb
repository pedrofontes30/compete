class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :email, :first_name, :last_name, :date_of_birth, :nationality, :gender, presence: true
  has_many :appointments
  has_many :lessons, through: :appointments
  has_one_attached :photo

  def has_appointment?(lesson)
    appointments.any?{ |appointment| appointment.lesson == lesson }
  end

  def appointment(lesson)
    raise
    appointments.find_by lesson: lesson
  end
end
