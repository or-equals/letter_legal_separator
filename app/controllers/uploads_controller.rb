class UploadsController < ApplicationController
  def create
    @upload = Upload.new(upload_params)

    splitter = PdfSplitter.new(@upload.pdf_file)
    splitter.split

    zipper = PdfZip.new(splitter)
    zipper.zip

    AdminMailer.pdf_uploaded.deliver_later
    send_file zipper.zip_location, filename: zipper.zipfile_name, content_type: 'application/zip'
  end

  private

  def upload_params
    params.require(:upload).permit(:pdf_file)
  end
end
