class PdfsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_pdf, only: [:show, :edit, :update, :destroy, :toggle_pinned]
  before_action :authenticate_admin, only: [:new, :create, :destroy, :edit, :update]

  def download_file
 redirect_to paperclip_attachment.file.url
end
  def index
    @pdfs = Pdf.all

  end
  def show
  end
  def new
    @pdf = Pdf.new
  end
  def edit
  end
  def toggle_pinned
    if(current_user.pdfs.find(@pdf.id).any?)
      current_user.pdfs.delete(@pdf)
    else
      current_user.pdfs << @pdf
    end
  end

  def create
    @pdf = Pdf.new(pdf_params)

    respond_to do |format|
      if @pdf.save
        format.html { redirect_to @pdf, notice: 'Pdf was successfully created.' }
        format.json { render :show, status: :created, location: @pdf }
      else
        format.html { render :new }
        format.json { render json: @pdf.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @pdf.update(pdf_params)
        format.html { redirect_to @pdf, notice: 'Pdf was successfully updated.' }
        format.json { render :show, status: :ok, location: @pdf }
      else
        format.html { render :edit }
        format.json { render json: @pdf.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @pdf.destroy
    respond_to do |format|
      format.html { redirect_to pdfs_url, notice: 'Pdf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pdf
      @pdf = Pdf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pdf_params
      params.require(:pdf).permit(:document, :pdfname, :pinned)
    end
end
