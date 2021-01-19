class PdfSplitter
  attr_reader :letter_pdf, :legal_pdf, :original_pdf, :pdf_wrapper, :stacking_guide

  def initialize(pdf_file)
    @original_pdf   = pdf_file
    @pdf_wrapper    = CombinePDF.parse(pdf_file.download)
    @letter_pdf     = CombinePDF.new
    @legal_pdf      = CombinePDF.new
    @stacking_guide = StackingGuide.new
  end

  def split
    pdf_wrapper.pages.each do |page|
      if legal_page?(page)
        stacking_guide.add(:legal)
        legal_pdf << page
      else
        stacking_guide.add(:letter)
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
    original_pdf.attachment.filename.base + name_extension + original_pdf.attachment.filename.extension_with_delimiter
  end

  private

  def legal_page?(page)
    page.page_size.last > 800
  end
end
