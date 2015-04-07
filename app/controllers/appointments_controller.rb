class AppointmentsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
  end

  def new
    @appointment = Appointment.new
    @user = User.find(session[:user_id])
    @doctor = Doctor.all
  end

  def create
    @user = User.find(params[:user_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = @user.id
    @appointment.doctor_id
    if @appointment.save
      redirect_to appointments_path, notice: "Appointment Created with #{@appointment.doctor.name}"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @appointment = Appointment.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: "Appointment Updated with #{@appointment.doctor.name}"
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :doctor_id)
  end

end
