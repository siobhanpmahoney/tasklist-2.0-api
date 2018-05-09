class Api::V1::PagesController < ApplicationController

  def index
    @pages = Page.all
    render json: @pages
  end

  def create
    @page = Page.create(path: params[:path], title: params[:title])
    render json: @page
  end

  def show
    @page = Page.find(params[:id])
    render json: @page
  end

  private

  def page_params
    params.require(:page).permit(
      :path,
      :title,
      task_ids: [],
      tasks_attributes: [
        :title,
        :description,
        :github_branch,
        :priority,
        :status_summary
      ],
      tag_ids: [],
      tags_ids: [
        :title
      ]
    )
  end


end
