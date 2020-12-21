class UploadsController < ApplicationController
  def create
    pdf_splitter.split
    pdf_zipper.zip
    AdminMailer.pdf_uploaded.deliver_later
    send_file pdf_zipper.zip_location, filename: pdf_zipper.zipfile_name, content_type: 'application/zip'
  end

  private

  def uploaded_pdf
    upload_params['pdf_file']
  end

  def pdf_splitter
    @pdf_splitter ||= PdfSplitter.new(uploaded_pdf)
  end

  def pdf_zipper
    @pdf_zipper ||= PdfZip.new(pdf_splitter)
  end

  def upload_params
    params.require(:upload).permit(:pdf_file)
  end
end
