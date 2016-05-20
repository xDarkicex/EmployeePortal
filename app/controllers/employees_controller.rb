class EmployeesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_employee, only: [:show]

  # GET /employees
  # GET /employees.json
  def index
    @employees = User.all
  end

  def show
    @employee = User.find(params[:id])
  end
  protected
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = User.find(params[:id])
    end
end
