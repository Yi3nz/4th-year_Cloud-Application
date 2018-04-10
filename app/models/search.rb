class Search < ActiveRecord::Base

  def search_patients
    patients = Patient.all

    patients = patients.where(["name LIKE ?","%#{keywords}%"]) if keywords.present?
    # patients = patients.where(["date LIKE ?",date_of_birth]) if date_of_birth.present?
    patients = patients.where(["address LIKE ?",address]) if address.present?
    patients = patients.where(["phone_no LIKE ?",phone_no]) if phone_no.present?
    patients = patients.where(["infection LIKE ?",infection]) if infection.present?
    patients = patients.where(["injury LIKE ?",injury]) if injury.present?
    patients = patients.where(["min_consultation LIKE ?",min_consultation]) if min_consultation.present?
    patients = patients.where(["max_consultation LIKE ?",max_consultation]) if max_consultation.present?

    return patients
  end

end
