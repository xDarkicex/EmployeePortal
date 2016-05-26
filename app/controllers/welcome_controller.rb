class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_employee, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_admin, only: [:destroy, :edit, :update]

  def index
    @employees = User.all
  end

  def show
  end

  def edit
  end


protected
  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = User.find(params[:id])
  end
  def employee_params
    params.require(:user).permit(:avatar, :bio, :gender, :sexuality, :skills, :name, :jobtitle, :phone, :portfolio, :email, :admin)
  end
end
