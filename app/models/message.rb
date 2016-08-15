class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  field :private, type: Boolean
  field :sender_id, type: String
  # belongs_to :sender, name: :user
  belongs_to :user
  validates_presence_of :title, :message => "Can't be blank"
  validates_presence_of :body, :message => "Can't be blank"
  def sender_name
    (defined? self.sender_id and self.sender_id != nil)? (User.find(id:self.sender_id).name) : 'UNDEFINED'
  end
end
