class HelpTicket
  include Mongoid::Document
  include Mongoid::Timestamps
  field :device, type: String
  field :title, type: String
  field :pinned, type: Boolean, default: false
  embeds_many :comments
  field :body, type: String
  belongs_to :user
end
