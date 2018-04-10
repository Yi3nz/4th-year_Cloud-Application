require 'elasticsearch'
require 'elasticsearch/model'

class Patient < ActiveRecord::Base

  belongs_to :user
  #Counter reference https://www.youtube.com/watch?v=e3eXuvBQums
  has_many :consultations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }

  scope :recent,    ->{ order("created_at DESC") }
  scope :dangerous, ->{ where("consultations_count >= ?", 1) }
  scope :well,      ->{ where(consultations_count: 0) }

  # #Elastic_Search reference https://www.youtube.com/watch?v=Pse-2ZkVaTs
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  searchkick word_middle: [:name, :date_of_birth]

  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"])
    else
      all
    end
  end
  # def search_data
  #   {
  #     name: name,
  #     date_of_birth: date_of_birth
  #   }
  # end

  # include Tire::Model::Search
  # include Tire::Model::Callbacks
  #Reference - Ruby on Rails - Railscasts #306 Elasticsearch Part 1
  # def self.search(params)
  #   tire.search(load: true) do
  #     query { string params[:query] } if params[:query].present?
  #   end
  # end
end
