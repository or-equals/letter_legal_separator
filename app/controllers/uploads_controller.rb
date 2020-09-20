class UploadsController < ApplicationController
  before_action :set_upload, only: [:show]

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)

    if @upload.save
      flash[:notice] = "Upload was successfully created."
      send_data @upload.pdf_file.download, filename: @upload.pdf_file.filename.to_s, content_type: @upload.pdf_file.content_type
    else
      render 'pages/index'
    end
  end

  private

  def set_upload
    @upload = Upload.find(params[:id])
  end

  def upload_params
    params.require(:upload).permit(:pdf_file)
  end
end
