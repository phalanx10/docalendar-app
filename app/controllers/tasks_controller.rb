class TasksController < ApplicationController
  def index
    @tasks = Task.includes(:user).order('created_at DESC')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :start_time, :end_time, :category_id, :priority_id).merge(user_id: current_user.id)
  end

end
