class NotificationMailer < ApplicationMailer
  def subscribe(subscription)
    @subscription=subscription
    @root_url=root_url
    mail(:to => "#{subscription.email}",
      :bcc => "mohit@99tests.com", 
      :subject => "Thank you for subscribing.")
  end

  def send_message(message)
    @message=message
    @root_url=root_url
    mail(:to => "#{message['email']}",
      :bcc => "mohit@99tests.com", 
      :subject => "Thank you for contacting me.")
  end
end
