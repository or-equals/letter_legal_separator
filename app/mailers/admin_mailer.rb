class AdminMailer < ApplicationMailer

  def pdf_uploaded
    mail(to: 'josh@ghed.dev', subject: 'Somebody generated a document')
  end
end
