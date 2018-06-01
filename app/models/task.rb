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

  accepts_nested_attributes_for :status_details



  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :pages
  accepts_nested_attributes_for :users


  def task_tags
    self.tags
  end

  def task_pages
    self.pages
  end

  def task_users
    self.users
  end

  def task_info
    {task: self, tags: self.task_tags, pages: self.task_pages, users: self.task_users}
  end

  def find_save_tags(rel_tags)
    rel_tags.each do |t|
      @tag = Tag.all.find_or_create_by(title: t)
      self.tags << @tag
    end
  end

  def find_save_pages(rel_pages)
    rel_pages.each do |p|
      @page = Page.all.find_or_create_by(path: p)
      self.pages << @page
    end
  end

  def find_save_users(rel_users)
    rel_users.each do |u|
      @user = User.find_by(username: u)
      self.users << @user
    end

  end

  def find_save_update_tags(rel_tags)
    rel_tags.each do |t|
      @tag = Tag.all.find_or_create_by(title: t["title"])
      self.tags << @tag
    end
  end

  def find_save_update_pages(rel_pages)
    rel_pages.each do |p|
        @page = Page.all.find_or_create_by(path: p["path"])
        self.pages << @page

    end
  end

  def find_save_update_users(rel_users)
    rel_users.each do |u|
      @user = User.all.find_by(username: u["username"])
      self.users << @user
    end

  end

end
