class Todo
  include Mongoid::Document
  include Mongoid::Timestamps
  field :note, type: String
  field :done, type: Boolean, default: false
  belongs_to :user
end
