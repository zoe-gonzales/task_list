class TasksController < ApplicationController
  http_basic_authenticate_with name: "zoe", password: "zoe", only: [:create, :destroy, :update]
  # all public routes must come before private ones
  # display all records
  def index
    @tasks = Task.all
  end
  # display 1 record
  def show
    @task = Task.find(params[:id])
  end
  # render form and generates empty instance
  def new
    @task = Task.new
  end
  # render form to edit record
  def edit
    @task = Task.find(params[:id])
  end
  # saves new record (same as POST request)
  def create
    # render plain: params[:task].inspect
    @task = Task.new(task_params)
    # save to db if new task is valid
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  # updates record (same as PUT)
  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  # deletes record (same as DELETE)
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:text)
  end
end
