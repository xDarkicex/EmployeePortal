class Comment
  include Mongoid::Document
  field :body, type: String
  belongs_to :user
  embedded_in :help_ticket
end
