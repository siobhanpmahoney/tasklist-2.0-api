class Status
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String
  field :latest_update, type: Boolean
  field :flag, type: Boolean

  embedded_in :task
end
