class MessagesController < ApplicationController
  def create
    subscription=Message.new(subscription_params)
    if subscription.invalid?
      flash[:notice]="Unable to send message because #{subscription.error_message}"
      redirect_to :back
      return
    end
    if subscription.save
      flash[:notice]="Message was successfully sent. Please check your email for the reply."
      redirect_to :back
    end
  end

  private
  def subscription_params
    params.require(:message).permit(:name,:email,:message)
  end
end
