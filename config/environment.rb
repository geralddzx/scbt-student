# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.production?
  ENV['HOST'] = "http://stanfordcollege.ca"
  # only send real emails in production; use Sengrid
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
  ActionMailer::Base.delivery_method ||= :smtp
elsif Rails.env.development?
  ENV['HOST'] = "http://localhost:3000"
  # Remember the letter_opener gem? It won't send real emails; it
  # just opens them in another tab. (Remember to add the letter_opener
  # gem to your development group in the Gemfile)
  ActionMailer::Base.delivery_method = :letter_opener
end