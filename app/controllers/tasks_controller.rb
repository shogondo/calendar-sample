class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    if params[:date].present?
      @task.date = Date.parse(params[:date])
    end
  end

  # GET /tasks/1/edit
  def edit
    @tasks = Task.all
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to home_path, notice: "タスクを登録しました"
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to home_path, notice: "タスクを更新しました"
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :description, :date)
    end
end
