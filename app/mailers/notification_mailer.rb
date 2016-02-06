class NotificationMailer < ApplicationMailer
  def subscribe(subscription)
    @subscription=subscription
  end

  def message(message)
    @message=message
    mail(:to => "#{message.email}",
      :bcc => "mohit@99tests.com", 
      :subject => "Thank you for contacting me.")
  end
end
