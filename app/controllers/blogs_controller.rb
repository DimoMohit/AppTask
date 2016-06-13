class BlogsController < ApplicationController
  before_action :authenticate_user! ,only: [:create,:new,:update,
    :edit,:destroy]
  def index
    if params[:offset]
      @blogs=Blog.where(publish: true).offset(params[:offset]).first(10)
    else
      @blogs=Blog.where(publish: true).last(10)
    end
  end
  def show
    @blog=Blog.find_by_header(params[:id])||Blog.find(params[:id])
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
  def destroy
    current_user.blogs.find(params[:id]).destroy
    redirect_to blogs_url
  end
  private
  def blog_params
      params.require(:blog).permit(:header,:sub_header,
        :blog_content,:publish,:url,:meta)
  end
end
