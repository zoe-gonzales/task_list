class SubTasksController < ApplicationController
  http_basic_authenticate_with name: "zoe", password: "zoe", only: [:destroy]
  def create
    @task = Task.find(params[:task_id])
    @sub_task = @task.sub_tasks.create(sub_task_params)
    redirect_to task_path(@task)
  end

  def show
    @task = Task.find(params[:task_id])
    puts @task
    @sub_task = @task.sub_tasks.find(params[:id])
  end

  def edit
    @task = Task.find(params[:task_id])
    @sub_task = @task.sub_tasks.find(params[:id])
  end

  def update
    @task = Task.find(params[:task_id])
    @sub_task = @task.sub_tasks.find(params[:id])

    if @sub_task.update(sub_task_params)
      redirect_to task_path(@task)
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    @sub_task = @task.sub_tasks.find(params[:id])
    @sub_task.destroy
    redirect_to task_path(@task)
  end

  private
  def sub_task_params
    params.require(:sub_task).permit(:text, :complete)
  end
end
