class Api::V1::TasksController < ApplicationController

  def index
    @tasks = Task.all
    all_task_info = @tasks.map { |t| t.task_info }
    render json: all_task_info
  end

  def create

    @task = Task.create(title: params[:title], description: params[:description], priority: params[:priority], status_summary: params[:status_summary])
    render json: @task
  end

  def show
    @task = Task.find(params[:id])
    render json: @task
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    render json: @task
  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :github_branch,
      :priority,
      :status_summary,
      status_detail_ids: [],
      status_details_attributes: [
        :description,
        :flag,
        :latest_update
        ],
      tag_ids: [],
      tags_ids: [
        :title
      ],
      page_ids: [],
      pages_attributes: [
        :path,
        :title,
      ],
      user_ids: [],
      users_attributes: [
        :first_name,
        :last_name,
        :username,
        :email,
        :password,
        :password_confirmation
      ]
    )
  end
end
