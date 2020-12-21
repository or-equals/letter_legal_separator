class AdminMailer < ApplicationMailer
  def pdf_uploaded
    mail(to: 'josh@orequals.com', subject: 'Somebody generated a document')
  end
end
