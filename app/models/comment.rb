class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String
  belongs_to :user
  has_many :comments
  belongs_to :comment
  belongs_to :help_ticket
end
