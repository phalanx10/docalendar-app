class TasksController < ApplicationController
  before_action :move_to_signin
  before_action :set_task, only: [:destroy, :edit, :update, :show]
  before_action :move_to_index, except: [:new, :index, :create]

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
    @task = current_user.tasks
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
    @task.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    if @task.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_time, :end_time, :category_id, :priority_id).merge(user_id: current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def move_to_signin
    authenticate_user! unless user_signed_in?
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @task.user.id
  end
end
