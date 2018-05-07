class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String
  field :email, type: String
  field :password, type: String

  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :pages
end
