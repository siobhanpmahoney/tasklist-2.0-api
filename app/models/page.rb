class Page
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  field :path, type: String
  field :title, type: String

  has_and_belongs_to_many :tasks, autosave: true
  has_and_belongs_to_many :users, autosave: true
  has_and_belongs_to_many :tags, autosave: true

  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :tags
end
