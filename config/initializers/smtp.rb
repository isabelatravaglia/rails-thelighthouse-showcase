ActionMailer::Base.smtp_settings = {
  domain: ENV["MAIL_DOMAIN"],
  address:        ENV["MAILGUN_ADDRESS"],
  port:           ENV["MAILGUN_PORT"],
  authentication: :plain,
  user_name:      ENV["MAILGUN_USER"],
  password:       ENV["MAILGUN_API_KEY"]

}