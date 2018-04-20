require 'observer'

class Consultation < ActiveRecord::Base

  after_save :log_con

  #Include the module in the lib folder
  include C_notifier #Patient.new.hello
  include Observable

  # attr_accessor :cat, :x_ray, :other
  attr_accessor :consulations
  # @consulations=[]

  #Counter cache reference https://www.youtube.com/watch?v=e3eXuvBQums
  belongs_to :patient, counter_cache: true

  #Reference the Korean guy
  # before_save ConsultationCallbacks.new
  # after_save ConsultationCallbacks

  private
    def log_con
      puts "Success to save!!!"
      # UserMailer.welcome_message(self).deliver
    end
end
