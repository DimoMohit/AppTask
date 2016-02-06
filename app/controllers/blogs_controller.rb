class BlogsController < ApplicationController
  before_action :authenticate_user! ,only: [:create,:new,:update,:edit]
  def index
    if params[:offset]
      @blogs=Blog.offset(params[:offset]).first(10)
    else
      @blogs=Blog.last(10)
    end
  end
  def create
    subscription=Blog.new(blog_params)
    if subscription.invalid?
      flash[:notice]="Unable to post because #{subscription.error_message}"
      redirect_to :back
      return
    end
    if subscription.save
      flash[:notice]="Thanks for posting the blog."
      redirect_to :back
    end
  end
  private
  def blog_params
      params.require(:blog).permit(:header,:sub_header,
        :blog_content,:publish)
  end
end
