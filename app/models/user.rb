class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  has_many :appointments
  has_many :doctors, through: :appointments
end
