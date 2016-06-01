class Technicalassistance
  include Mongoid::Document
  include Mongoid::Timestamps
  field :device, type: String
  field :title, type: String
  field :body, type: String
  # field :technicalassistance_id, type: String
  # field :parent_id, type: String
  embeds_many :technicalassistance 
  belongs_to :user
end
