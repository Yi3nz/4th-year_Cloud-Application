class Patient < ActiveRecord::Base
  belongs_to :user
  has_many :consultations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }

end
