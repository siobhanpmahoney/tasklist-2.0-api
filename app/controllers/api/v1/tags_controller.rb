class Api::V1::TagsController < ApplicationController

  def index
    @tags = Tag.all
    render json: @tags
  end

  def create
    @tag = Tag.create
    render json: @tag
  end

  def show
    @tag = Tag.find(params[:id])
    render json: @tag
  end

  private

  def tag_params
    params.require(:tag).permit(
      :title,
      task_ids: [],
      tasks_attributes: [
        :title,
        :description,
        :github_branch,
        :priority,
        :status_summary
      ],
      page_ids: [],
      pages_attributes: [
        :path,
        :title,
      ]
    )
  end

end
