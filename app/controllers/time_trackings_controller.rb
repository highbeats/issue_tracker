class TimeTrackingsController < ApplicationController
  respond_to :json

  before_filter :load_task, only: [ :create, :destroy ]

  def new
    @time_tracking = current_manager.time_trackings.build
    respond_with @time_tracking
  end

  def show

  end

  def index
    @time_trackings = current_manager.time_trackings
    respond_with @time_trackings
  end

  def create
    @time_tracking = @task.time_trackings.create!
    respond_with @time_tracking
  end

  def destroy
    @time_tracking = @task.time_trackings.find(params[:id])
    TimeTracking.terminate(@time_tracking)
    respond_with @time_tracking, status: :ok
  end

  protected

  def load_task
    @task = current_manager.tasks.find(params[:task_id])
  end
end
