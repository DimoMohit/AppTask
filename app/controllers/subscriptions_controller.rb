class SubscriptionsController < ApplicationController
  def create
    subscription=Subscription.new(subscription_params)
    if subscription.invalid?
      flash[:notice]="Unable to subscribe because #{subscription.error_message}"
      redirect_to :back
      return
    end
    if subscription.save
      flash[:notice]="Thanks for subscribing. Please check your email for verification email."
      redirect_to :back
    end
  end
  private
  def subscription_params
    params.require(:subscription).permit(:name,:email,:msg)
  end
end
