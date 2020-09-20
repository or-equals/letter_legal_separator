class UploadsController < ApplicationController
  def create
    @upload = Upload.new(upload_params)

    if @upload.save
      send_data @upload.pdf_file.download, filename: @upload.pdf_file.filename.to_s, content_type: @upload.pdf_file.content_type
    else
      render 'pages/index'
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:pdf_file)
  end
end
