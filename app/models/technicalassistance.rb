class Technicalassistance
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :device, type: String
  field :descripton, type: String

end
