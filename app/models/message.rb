class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  belongs_to :user
  validates_presence_of :title, :message => "Can't be blank"
  validates_presence_of :body, :message => "Can't be blank"
end
