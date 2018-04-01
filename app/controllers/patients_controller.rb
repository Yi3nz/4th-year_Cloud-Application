class PatientsController < ApplicationController

  #The user needed to be authenticated on every action except...
  http_basic_authenticate_with name: "doc", password: "secret", except:[:index, :show]

  before_action :find_patient, only: [:show, :edit, :update, :destroy]
  def index
    if user_signed_in?
      #@patients = Patient.all.order("created_at DESC")
      @patients = Patient.where(:user_id => current_user.id).order("created_at DESC")
    end
  end

  def show # Rails will pass all instance variables to the view.
  end

  def new #@patient = Patient.new
    @patient = current_user.patients.build
  end

  def create
    @patient = current_user.patients.build(patient_params) #Save the data from the form to the table model

    if @patient.save
      redirect_to @patient #Redirect the user to show the action
    else
      # The render method is used so that the @article object is passed back to the new template when it is rendered
      render 'new'
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render 'edit'
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  private
    def patient_params
      params.require(:patient).permit(:name, :date_of_birth,
                                      :address, :phone_no, :infection,
                                      :injury, :special_observation)
    end

    def find_patient
      @patient = Patient.find(params[:id])
    end

end
