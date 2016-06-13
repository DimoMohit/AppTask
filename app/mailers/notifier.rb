class Notifier < ApplicationMailer
  def notify(email_from,name,message)
    @message=message
    @name=name
    mail(:to => 'mohit@99tests.com',
      :cc => email_from,
      :bcc => "dimomohit@gmail.com", 
      :subject => "Thank you for contacting.")
  end
end
