ActionMailer::Base.smtp_settings = {
  domain: 'mail.discoverthelighthouse.com',
  address:        "smtp.eu.mailgun.org",
  port:            587,
  authentication: :plain,
  user_name:      'postmaster@mail.discoverthelighthouse.com',
  password:       ENV["MAILGUN_API_KEY"]
}