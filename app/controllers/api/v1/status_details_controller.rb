class Api::V1::StatusDetailsController < ApplicationController

  def index
    @task = Task.find(params[:task_id])
    @status_details = @task.status_details
    render json: @status_details
  end

  def create
    @task = Task.find(params[:task_id])
    @status_detail = @task.status_details.create(description: params[:description], latest_update: params[:latest_update], flag: params[:flag])
    render json: @task
  end

  def show
    @task = Task.find(params[:task_id])
    @status_detail = @task.status_details.find(params[:id])
    render json: @status_detail
  end

  private



end
