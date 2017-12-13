class User < ApplicationRecord
  #Auth
  has_secure_password
  #Relations
  belongs_to :rol, foreign_key: 'rol_id'
  #Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
