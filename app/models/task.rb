class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :github_branch, type: String
  field :priority, type: Boolean
  field :status, type: String

  embeds_many :statuses
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :pages
  has_and_belongs_to_many :users

  validates :name, uniqueness: true
end
