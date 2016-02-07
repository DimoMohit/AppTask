# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
if Rails.env == "production"
  ActionMailer::Base.smtp_settings = {
    :user_name => 'dimomohit10',
    :password => 'dimo10MOHIT',
    :domain => 'dimomohit.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end
if Rails.env == "development"
  ActionMailer::Base.smtp_settings = {
    :user_name => 'dimomohit10',
    :password => 'dimo10MOHIT',
    :domain => 'dimomohit.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end