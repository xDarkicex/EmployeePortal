class Welcome
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
    has_many :users
end
