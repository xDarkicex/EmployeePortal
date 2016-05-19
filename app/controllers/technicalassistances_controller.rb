class TechnicalassistancesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_technicalassistance, only: [:show, :edit, :update, :destroy]

  # GET /technicalassistances
  # GET /technicalassistances.json
  def index
    @technicalassistances = Technicalassistance.all
  end

  # GET /technicalassistances/1
  # GET /technicalassistances/1.json
  def show
  end

  # GET /technicalassistances/new
  def new
    @technicalassistance = Technicalassistance.new
  end

  # GET /technicalassistances/1/edit
  def edit
  end

  # POST /technicalassistances
  # POST /technicalassistances.json
  def create
    @technicalassistance = Technicalassistance.new(technicalassistance_params)

    respond_to do |format|
      if @technicalassistance.save
        format.html { redirect_to @technicalassistance, notice: 'Technicalassistance was successfully created.' }
        format.json { render :show, status: :created, location: @technicalassistance }
      else
        format.html { render :new }
        format.json { render json: @technicalassistance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /technicalassistances/1
  # PATCH/PUT /technicalassistances/1.json
  def update
    respond_to do |format|
      if @technicalassistance.update(technicalassistance_params)
        format.html { redirect_to @technicalassistance, notice: 'Technicalassistance was successfully updated.' }
        format.json { render :show, status: :ok, location: @technicalassistance }
      else
        format.html { render :edit }
        format.json { render json: @technicalassistance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /technicalassistances/1
  # DELETE /technicalassistances/1.json
  def destroy
    @technicalassistance.destroy
    respond_to do |format|
      format.html { redirect_to technicalassistances_url, notice: 'Technicalassistance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technicalassistance
      @technicalassistance = Technicalassistance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def technicalassistance_params
      params.require(:technicalassistance).permit(:title, :device, :descripton, :time)
    end
end
