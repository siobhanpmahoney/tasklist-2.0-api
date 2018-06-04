class Page
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps
  field :path, type: String
  field :title, type: String

  has_and_belongs_to_many :tasks, autosave: true, index: true
  has_and_belongs_to_many :users, autosave: true, index: true
  has_and_belongs_to_many :tags, autosave: true, index: true

  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :tags



end
