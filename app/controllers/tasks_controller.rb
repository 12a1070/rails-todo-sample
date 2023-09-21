class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
# 投稿を新規作成。タスクの内容をcreateアクションに送る
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:title)
    end
end
