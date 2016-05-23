class EmployeesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_employee, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_admin, only: [:destroy, :edit, :update]

  # GET /employees
  # GET /employees.json
  def index
    @employees = User.all
  end

  def show
    # @employee = User.find(params[:id])
  end

  def edit
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employee_path(@employee), notice: 'employee was successfully updated.' }
        format.json { render :show, status: :ok, location: employee_path(@employee) }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    # @employee = User.find(params[:id])
    # @employee.destroy
    if @employee.destroy
        redirect_to root_url, notice: "Employee deleted."
    end
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
