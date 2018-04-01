class ConsultationsController < ApplicationController

  def create
    @patient = Patient.find(params[:patient_id])
    @consultation = @patient.consultations.create(consultation_params)
    redirect_to patient_path(@patient)
  end

  def destroy
    @patient = Patient.find(params[:patient_id])
    @consultation = @patient.consultations.find(params[:id])
    @consultation.destroy
    redirect_to patient_path(@patient)
  end

  private
  def consultation_params
    params.require(:consultation).permit(:cat, :x_ray, :other)
  end

end
