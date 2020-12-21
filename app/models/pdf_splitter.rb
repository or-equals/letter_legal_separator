class PdfSplitter
  attr_reader :letter_pdf, :legal_pdf, :original_pdf, :pdf_wrapper

  def initialize(pdf_file)
    @original_pdf = pdf_file
    @pdf_wrapper  = CombinePDF.parse(pdf_file.read)
    @letter_pdf   = CombinePDF.new
    @legal_pdf    = CombinePDF.new
  end

  def split
    pdf_wrapper.pages.each do |page|
      if legal_page?(page)
        legal_pdf << page
      else
        letter_pdf << page
      end
    end
  end

  def rendered_legal_pdf
    legal_pdf.save(rendered_legal_pdf_filename)
    legal_pdf.to_pdf
  end

  def rendered_legal_pdf_filename
    rendered_filename('_legal_split')
  end

  def rendered_letter_pdf_filename
    rendered_filename('_letter_split')
  end

  def rendered_letter_pdf
    letter_pdf.save(rendered_letter_pdf_filename)
    letter_pdf.to_pdf
  end

  def rendered_filename(name_extension)
    File.basename(original_pdf.original_filename, '.pdf') + name_extension + '.pdf'
  end

  private

  def legal_page?(page)
    page.page_size.last > 800
  end
end
