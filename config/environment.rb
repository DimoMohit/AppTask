# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
if Rails.env == "production"
  ActionMailer::Base.smtp_settings = {
    :user_name => 'dimomohit@gmail.com',
    :password => 'GANGAnilamDUTTA23!',
    :domain => 'dimomohit.com',
    :address => 'smtp.gmail.com',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end