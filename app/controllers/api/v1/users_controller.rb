class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if @user
      render json: @user
    else
      render json: {message: "Error, new user not saved"}
    end
  end

  def show
    @user = User.find_by(username: params[:username])
    user_info = {user: @user, tasks: @user.user_tasks}
    render json: user_info
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username,
      :email,
      :password,
      :password_confirmation,
      task_ids: [],
      tasks_attributes: [
        :title,
        :description,
        :github_branch,
        :priority,
        :status_summary,
      ],
      page_ids: [],
      pages_attributes: [
        :path,
        :title
      ]
    )
  end

end
