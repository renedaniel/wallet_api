class User < ApplicationRecord
  #Auth
  has_secure_password
  #Relations
  belongs_to :rol, foreign_key: 'id_rol'
  #Validations
  validates :first_name, presence: true
  validates :last_name, presence: {message: "must be given please"}
end
