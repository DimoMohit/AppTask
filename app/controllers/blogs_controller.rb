class BlogsController < ApplicationController
  before_action :authenticate_user! ,only: [:create,:new,:update,:edit]
  def index
    if params[:offset]
      @blogs=Blog.offset(params[:offset]).first(10)
    else
      @blogs=Blog.last(10)
    end
  end
  def show
    @blogs=Blog.find(params[:id])
    render :index
  end
  def create
    blog=Blog.new(blog_params)
    if blog.invalid?
      flash[:notice]="Unable to post because #{blog.error_message}"
      redirect_to :back
      return
    end
    if blog.save
      flash[:notice]="Thanks for posting the blog."
      redirect_to blogs_url
    end
  end
  def update
    blog=current_user.blogs.find(params[:id])
    blog.update_attributes(blog_params)
    if blog.invalid?
      flash[:notice]="Unable to post because #{blog.error_message}"
      redirect_to :back
      return
    end
    if blog.save
      flash[:notice]="Thanks for posting the blog."
      redirect_to blogs_url
    end
  end
  def edit
    @blog=current_user.blogs.find(params[:id])
    render "new"
  end
  private
  def blog_params
      params.require(:blog).permit(:header,:sub_header,
        :blog_content,:publish)
  end
end
