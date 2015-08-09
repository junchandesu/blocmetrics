if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.mailgun.org',
    port:           '587',
    authentication: :plain,
    #address: '209.61.151.224',
    user_name:      ENV['MAILGUN_SMTP_LOGIN'],
    password:       ENV['MAILGUN_SMTP_PASSWORD'],
    domain:         'appc748f2dbca6746aaa1fcc8b6f427631b.mailgun.org',
    enable_starttls_auto: true
  }
end