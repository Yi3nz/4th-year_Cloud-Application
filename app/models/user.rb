class User < ApplicationRecord

  has_many :patients
  
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
