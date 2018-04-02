class Patient < ActiveRecord::Base
  belongs_to :user
  #Counter reference https://www.youtube.com/watch?v=e3eXuvBQums
  has_many :consultations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }

  scope :recent,    ->{ order("created_at DESC") }
  scope :dangerous, ->{ where("consultations_count >= ?", 2) }
  scope :well,      ->{ where(consultations_count: 0) }
end
