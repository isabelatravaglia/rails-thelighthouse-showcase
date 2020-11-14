class ContactMailer < ApplicationMailer
  
  def contact(message)
    @message = message
    @body = message.body
    mail(to: ENV['CONTACT_EMAIL'], subject: "Novo contato de #{message.name}, #{message.email}", from: ENV['CONTACT_EMAIL'])

    # @new_contact = message
    
    # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    # mg_client = Mailgun::Client.new ENV['mailgun_secret_api_key']
    
    # from = Email.new(email: 'test@example.com')
    # to = Email.new(email: 'test@example.com')
    # subject = 'Sending with SendGrid is Fun'
    # content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    # mail = Mail.new(from, subject, to, content)
    # message_params = {from: message.email,
    #                   name: message.name,
    #                   to: ENV['CONTACT_EMAIL'],
    #                   subject: 'Contact Form',
    #                   text: message.body}
    # mg_client.send_message ENV['mailgun_domain'], message_params
    # response = sg.client.mail._('send').post(request_body: mail.to_json)
  end

end