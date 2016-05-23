class Technicalassistance
  include Mongoid::Document
  include Mongoid::Timestamps
  field :device, type: String
  field :title, type: String
  field :body, type: String
  field :parent_id, type: String
  # has_many :posts
  # belongs_to :post
  belongs_to :user
end
