class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :title, type: String
  field :description, type: String
  field :github_branch, type: String
  field :priority, type: Boolean
  field :status_summary, type: String

  embeds_many :status_details
  has_and_belongs_to_many :tags, autosave: true
  has_and_belongs_to_many :pages, autosave: true
  has_and_belongs_to_many :users, autosave: true



  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :pages
  accepts_nested_attributes_for :users
end
