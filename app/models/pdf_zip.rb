require 'zip'

class PdfZip
  attr_reader :pdf_splitter

  def initialize(pdf_splitter)
    @pdf_splitter = pdf_splitter
  end

  def zip
    # Delete .zip folder if it's already there
    FileUtils.rm_rf(zip_location)

    Zip::File.open(zip_location, Zip::File::CREATE) do |zipfile|
      zipfile.get_output_stream(pdf_splitter.rendered_legal_pdf_filename) { |f| f.puts pdf_splitter.rendered_legal_pdf }
      zipfile.get_output_stream(pdf_splitter.rendered_letter_pdf_filename) { |f| f.puts pdf_splitter.rendered_letter_pdf }
    end
  end

  def zipfile_name
    pdf_splitter.original_pdf.attachment.filename.base + '_split.zip'
  end

  def zip_location
    Rails.root.join("tmp/#{zipfile_name}")
  end
end
