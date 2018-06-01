class Api::V1::TasksController < ApplicationController



  def index
    @tasks = Task.all
    all_task_info = @tasks.map { |t| t.task_info }
    render json: all_task_info
  end

  def create
    puts params
    @task = Task.create(title: params[:title], description: params[:description], priority: params[:priority], status_summary: params[:status_summary])
    @task.find_save_update_pages(params[:rel_pages])
    @task.find_save_update_tags(params[:rel_tags])
    @task.find_save_update_users(params[:rel_users])
    task_info = @task.task_info
    render json: task_info
  end

  def show
    @task = Task.find(params[:id])
    task_info = @task.task_info
    render json: task_info
  end

  def update
    puts params
    @task = Task.find(params[:id])
    @task.update(title: params[:title], description: params[:description], priority: params[:priority], github_branch: params[:github_branch], status_summary: params[:status_summary] )
    @task.find_save_update_pages(params[:rel_pages])
    @task.find_save_update_tags(params[:rel_tags])
    @task.find_save_update_users(params[:rel_users])
    task_info = @task.task_info
    puts task_info
    render json: task_info
  end

  def destroy
    puts params
    Task.find(params[:id]).destroy
    @tasks = Task.all
    all_task_info = @tasks.map { |t| t.task_info }
    render json: all_task_info
  end

  # custom methods

  def task_page
    @task = Task.all.find(params[:id])
    @page = Page.all.find(params[:page_id])
    task_page = @task.pages.find(@page._id)
    render json: task_page
  end

  def destroy_task_page
    @task = Task.find(params[:id])
    @page = Page.find(params[:page_id])
    @task.pages.delete(@page)
    puts @task.pages
    render json: {alert: "job deleted"}
  end

  def task_tag
    @task = Task.all.find(params[:id])
    @tag = Tag.all.find(params[:tag_id])
    task_tag = @task.tags.find(@tag._id)
    render json: task_tag
  end

  def destroy_task_tag
    @task = Task.find(params[:id])
    @tag = @task.tags.find(params[:tag_id])
    @task.tags.delete(@tag)
    puts @task.tags
    render json: {alert: "job deleted"}
  end

  def task_user
    @task = Task.all.find(params[:id])
    @user = User.all.find(params[:user_id])
    task_user = @task.users.find(@user._id)
    render json: task_user
  end

  def destroy_task_user
    @task = Task.find(params[:id])
    @user = @task.users.find(params[:user_id])
    @task.users.delete(@user)
    puts @task.users
    render json: {alert: "job deleted"}
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
      tags_attributes: [
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
