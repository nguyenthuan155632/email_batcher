# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = { address: 'smtp.sendgrid.net',
                                     port: 587,
                                     domain: 'http://localhost:3000/',
                                     user_name: 'jackulti',
                                     password: 'jack1234$#@!',
                                     authentication: :plain,
                                     enable_starttls_auto: true }