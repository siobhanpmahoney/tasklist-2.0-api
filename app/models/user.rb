class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include Mongoid::Attributes::Dynamic
  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  has_secure_password

  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :pages

  has_secure_password

  validates :username, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

  validates :password, presence: true

end
