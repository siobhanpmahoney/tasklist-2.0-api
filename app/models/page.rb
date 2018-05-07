class Page
  include Mongoid::Document
  field :path, type: String
  field :title, type: String

  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tags
end
