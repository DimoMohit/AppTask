class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_task,only: [:show,:edit,:update,:assign,:assign_user]
  def create
    if current_user.is_admin
      task=(@task ? @task : Task.new(task_params))
      if @task
        task.assign_attributes(task_params)
      end
      if task.valid?
        task.save
        flash.now['info']="Task has been #{@task ? 'updated' : 'created'} successfully."
        redirect_to tasks_path
      else
        flash.now['danger']="Task was not be #{@task ? 'updated' : 'created'} because of following errors.\n #{task.errors.full_messages.uniq.join(' & ')}"
        @task=task
        render 'new'
      end
    end
  end
  def assign
    @best_fit=@task.best_person_for_the_task
    @alternate_fit=Task.candidate_set.first(7)
  end
  def assign_user
    user_task_map=@task.user_task_maps.build(user_id: params[:user])
    if user_task_map.valid?
      user_task_map.save
      flash['info']="Task has been successfully assigned to user #{params[:user]}."
      redirect_to assign_task_path(@task)
    else
      flash['danger']="Task was not assigned to user #{params[:user]} because #{user_task_map.errors.full_messages.uniq.join(' & ')}"
      redirect_to assign_task_path(@task)
    end
  end
  def update
    create
  end
  def index
    @tasks=Task.all.order(id: :desc)
  end
  def edit
    render 'new'
  end
  private
  def task_params
    params.require(:task).permit(:name,:description,
      :start_date,:end_date,:priority)
  end
  def get_task
    if current_user.is_admin
      @task=Task.find(params[:id])
    else
      @task=current_user.tasks.find(params[:id])
    end
  end
end
