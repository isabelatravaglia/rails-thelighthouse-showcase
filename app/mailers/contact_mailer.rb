class ContactMailer < ApplicationMailer
  
  def contact(message)
    @message = message
    @body = message.body
    mail(to: ENV['CONTACT_EMAIL'], subject: "Novo contato de #{message.name}, #{message.email}", from: ENV['CONTACT_EMAIL'])
  end

  def course_contact(message)
    @message = message
    @body = message.body
    mail(to: ENV['CONTACT_EMAIL'], subject: "Contato sobre #{message.course}, de #{message.name}, #{message.email}", from: ENV['CONTACT_EMAIL'])
  end

end