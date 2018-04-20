class PatientDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  # def age
  #   # 60 * 60 * 24 * 365.25 is 31557600
  #   # 31557600 is one year in seconds
  #   ((Time.now - date_of_birth) / 31557600).floor
  # end

end
