class PatientsController < ApplicationController

  #The user needed to be authenticated on every action except...
  http_basic_authenticate_with name: "doc", password: "secret", except:[:index, :show]

  def index
    @patients = Patient.all
  end

  def show # Rails will pass all instance variables to the view.
    @patient = Patient.find(params[:id])
  end

  def new # /patients/new
    @patient = Patient.new
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(patient_params) #Save the data from the form to the table model

    if @patient.save
      redirect_to @patient #Redirect the user to show the action
    else
      # The render method is used so that the @article object is passed back to the new template when it is rendered
      render 'new'
    end
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to @patient
    else
      render 'edit'
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    redirect_to patients_path
  end

  private
    def patient_params
      params.require(:patient).permit(:name, :date_of_birth,
                                      :address, :phone_no, :infection,
                                      :injury, :special_observation)
    end

end
