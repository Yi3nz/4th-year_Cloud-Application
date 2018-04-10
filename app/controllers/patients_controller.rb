class PatientsController < ApplicationController

  #Activated find_patient for selected methods
  before_action :find_patient, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      # @patients = Patient.where(:user_id => current_user.id).order("created_at DESC")
     @patients = Patient.where(:user_id => current_user.id).order("created_at DESC").search(params[:search])

     #@patients = Patient.search(params)
     #Reference - Ruby on Rails - Railscasts #306 Elasticsearch Part 1
      # if params[:query].present?
      #   @patients = Patient.search(params[:query])
      # else
      #   @patients = Patient.all
      # end

      #NEW
      # search = params[:query].present? ? params[:query] : nil
      # @patients = if search
      #   Patient.search(search)
      # else
      #   Patient.all
      # end

    end
  end

  ####################################
  def recent
    @patients = Patient.recent.order("created_at DESC")
    render action: :index
  end

  def dangerous
    @patients = Patient.dangerous.order("created_at DESC")
    render action: :index
  end

  def well
    @patients = Patient.well.order("created_at DESC")
    render action: :index
  end

  def show
  end

  def new
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
      params.require(:patient).permit(:name, :date_of_birth, :address, :phone_no,
                                      :infection, :injury, :special_observation)
    end

    def find_patient
      @patient = Patient.find(params[:id])
    end

end
