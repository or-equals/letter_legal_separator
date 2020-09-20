class UploadsController < ApplicationController
  before_action :set_upload, only: [:show]

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def set_upload
    @upload = Upload.find(params[:id])
  end

  def upload_params
    params.require(:upload).permit(:pdf_file)
  end
end
