class TasksController < ApplicationController
  respond_to :json, :html

  before_filter :initialize_task, only: :index
  before_filter :load_recent_tracked, only: :index

  def index
    @tasks = @current_manager.tasks.all
    respond_with @tasks
  end

  def show
  end

  def new
  end

  def create
    @task = current_manager.tasks.create(params[:task])
    respond_with @task do |format|
      format.html { redirect_to tasks_url }
    end
  end

  def edit
  end

  def update
    @task = current_manager.tasks.find(params[:id])
    @task.update_attributes(params[:task])
    respond_with_bip @task
  end

  def destroy
  end

  protected

  def initialize_task
    @task = current_manager.tasks.build
  end

  def load_recent_tracked
    @recent_tracked = TimeTracking.users_recent(current_manager)
  end

end
