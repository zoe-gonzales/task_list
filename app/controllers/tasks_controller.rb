class TasksController < ApplicationController
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
  def new;
    @task = Task.new
  end
  # render form to edit record
  def edit; end
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
  end

  # deletes record (same as DELETE)
  def destroy
  end

  private
  def task_params
    params.require(:task).permit(:text)
  end
end