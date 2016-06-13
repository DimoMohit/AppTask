class BlogsController < ApplicationController
  before_action :authenticate_user! ,only: [:create,:new,:update,
    :edit,:destroy]
  before_action :get_blog,only: [:edit,:update,:destroy]
  def index
    if params[:offset]
      @blogs=Blog.where(publish: true).offset(params[:offset]).first(10)
    else
      @blogs=Blog.where(publish: true).last(10)
    end
  end
  def show
    @blog=Blog.find_by_url(params[:id])||Blog.find(params[:id])
    render :index
  end
  def create
    blog=current_user.blogs.build(blog_params)
    blog.user=current_user
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
    @blog.update_attributes(blog_params)
    if @blog.invalid?
      flash[:notice]="Unable to post because #{blog.error_message}"
      redirect_to :back
      return
    end
    if @blog.save
      flash[:notice]="Thanks for posting the blog."
      redirect_to blogs_url
    end
  end
  def edit
    render "new"
  end
  def destroy
    @blog.destroy
    redirect_to blogs_url
  end
  private
  def blog_params
      params.require(:blog).permit(:header,:sub_header,
        :blog_content,:publish,:url,:meta)
  end
  def get_blog
    if current_user.is_admin?
      @blog=Blog.find(params[:id])
    else
      @blog=current_user.blogs.find(params[:id])
    end
  end
end
