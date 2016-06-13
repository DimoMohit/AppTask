class HomeController < ApplicationController
  def contact
    if params[:email].present? && params[:name].present? && params[:message].present?
      Notifier.notify(params[:email],params[:name],params[:message]).deliver_now!
      flash[:info] = "Thanks for contacting us." 
      redirect_to root_path
    else
      flash[:warning] = "Please provide your detail and proper message." 
      redirect_to root_path
    end
  end
end
