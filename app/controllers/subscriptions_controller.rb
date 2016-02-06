class SubscriptionsController < ApplicationController
  def create
    subscription=Subscription.new(subscription_params)
    if subscription.save
      flash[:notice]="Successfully subscribed. Please check you email."
    else
      flash[:error]="Unable to subscribe"
    end
  end
  private
  def subscription_params
      params.require(:subscription).permit(:name,:email,:message)
    end
  end
end
