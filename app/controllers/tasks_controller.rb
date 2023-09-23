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

  def edit
    @task = Task.find(params[:id])
      # タスクに割り振られているIDを見つけてタスクのインスタンス変数に代入
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
      # タスクに入力されたパラメーターをtaskのupdateアクションに渡す
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:title)
    end
end
