class UploadsController < ApplicationController
  def create
    @upload = Upload.new(upload_params)

    if @upload.valid?
      splitter = PdfSplitter.new(@upload.pdf_file)
      splitter.split

      zipper = PdfZip.new(splitter)
      zipper.zip
      send_file zipper.zip_location, filename: zipper.zipfile_name, content_type: 'application/zip'
    else
      render 'pages/index'
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:pdf_file)
  end
end
