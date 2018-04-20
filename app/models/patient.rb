class Patient < ActiveRecord::Base

  belongs_to :user
  #Counter reference https://www.youtube.com/watch?v=e3eXuvBQums
  has_many :consultations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }

  #Define the scopes - Implemented in patients_controller
  scope :recent,    ->{ order("created_at DESC") }
  scope :dangerous, ->{ where("consultations_count >= ?", 1) }
  scope :well,      ->{ where(consultations_count: 0) }

  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"])
    else
      all
    end
  end

end
