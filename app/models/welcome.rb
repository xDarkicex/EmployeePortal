class Welcome
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
    has_many :users
    field :title, type: String
    field :body, type: String
    field :pinned, type: Boolean, default: false
    belongs_to :user

end
