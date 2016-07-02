class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String
  belongs_to :user
  embedded_in :help_ticket
end
