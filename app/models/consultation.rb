class Consultation < ActiveRecord::Base
  #Counter cache reference https://www.youtube.com/watch?v=e3eXuvBQums
  belongs_to :patient, counter_cache: true
end
