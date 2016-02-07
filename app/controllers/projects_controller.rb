class ProjectsController < ApplicationController
  before_action :authenticate_user! 
  def index
    if params[:offset]
      @projects=Project.offset(params[:offset]).first(10)
    else
      @projects=Project.last(10)
    end
  end

  def show
    @project=Project.find(params[:id])
    render :index
  end

  def create
    project=current_user.projects.build(project_params)
    if project.invalid?
      flash[:notice]="Unable to post because #{project.error_message}"
      redirect_to :back
      return
    end
    if project.save
      flash[:notice]="Thanks for posting the project."
      redirect_to projects_url
    end
  end

  def update
    project=current_user.projects.find(params[:id])
    project.update_attributes(project_params)
    if project.invalid?
      flash[:notice]="Unable to post because #{project.error_message}"
      redirect_to :back
      return
    end
    if project.save
      flash[:notice]="Thanks for posting the project."
      redirect_to projects_url
    end
  end

  def edit
    @project=current_user.projects.find(params[:id])
    render "new"
  end

  def destroy
    current_user.projects.find(params[:id]).destroy
    redirect_to projects_url
  end
  
  private
  def project_params
    params.require(:project).permit(:name,:sub_header,
      :description,:url)
  end
end
