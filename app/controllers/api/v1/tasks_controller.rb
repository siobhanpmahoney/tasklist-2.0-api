class Api::V1::TasksController < ApplicationController

  def index
    @tasks = Task.all
    all_task_info = @tasks.map { |t| t.task_info }
    render json: all_task_info
  end

  def create
    puts params

    @task = Task.create(title: params[:title], description: params[:description], priority: params[:priority], status_summary: params[:status_summary])

    @task.find_save_pages(params[:rel_pages])
    @task.find_save_tags(params[:rel_tags])
    @task.find_save_users(params[:rel_users])
    # @task.tags << Tag.all[0]
    # @task.users << User.all[0]
    # @task.pages << Page.all[0]
    task_info = @task.task_info
    render json: task_info
  end

  def show
    @task = Task.find(params[:id])
    task_info = @task.task_info
    render json: task_info
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    task_info = @task.task_info
    render json: task_info
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
