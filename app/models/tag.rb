class Tag
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps

  field :title, type: String

  has_and_belongs_to_many :tasks, autosave: true
  has_and_belongs_to_many :pages, autosave: true

  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :pages
end
