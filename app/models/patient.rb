class Patient < ActiveRecord::Base
  has_many :consultations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }

end
