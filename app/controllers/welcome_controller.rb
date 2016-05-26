class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_employee, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_admin, only: [:destroy, :edit, :update]

  def index
    @employees = User.all
    @pdfs = Pdf.all
    @products = Product.all
    @technicalassistances = Technicalassistance.all
    @welcomes = Welcome.all
  end

  def show
  end

  def new
    @welcome = Welcome.new
  end


  def edit
  end
  def create
    @welcome = Welcome.new(welcome_params)

    respond_to do |format|
      if @welcome.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @welcome }
      else
        format.html { render :new }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @welcome.update(welcome_params)
        format.html { redirect_to @welcome, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @welcome }
      else
        format.html { render :edit }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @welcome.destroy
    respond_to do |format|
      format.html { redirect_to welcomes_url, notice: 'Notice was successfully destroyed.' }
      format.json { head :no_content }
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
  def set_welcome
    @welcome = Welcome.find(params[:id])
  end
  def welcome_params
    params.require(:welcome).permit(:avatar, :admin, :title, :body)
  end
end
