class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  has_mongoid_attached_file :productphoto, :styles => { :medium =>"500x500>", :thumb => "100x100>" }
  validates_attachment_content_type :productphoto, content_type: /\Aimage\/.*\Z/
  field :name, type: String
  field :price8oz, type: Money
  field :price64oz, type: Money
  field :price5gal, type: Money
  field :price55gal, type: Money
  field :descripton, type: String
  field :dosage, type: String

  validates_presence_of :name, :message => "Can't be blank"
  validates :name, length:{maximum: 15}
  validates :name, uniqueness: true
  validates_presence_of :descripton, :message => "Can't be blank"
  validates :descripton, length:{minimum: 15}

  validates_presence_of :dosage, :message => "Can't be blank"

end
