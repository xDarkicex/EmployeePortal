class Employee
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  has_mongoid_attached_file :avatar, :styles => { :medium =>"500x500>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  field :name, type: String
  field :jobtitle, type: String
  field :skills, type: String
  field :gender, type: String
  field :email, type: String
  field :phone, type: String
  field :bio, type: String

  validates_presence_of :name, :message => "Can't be blank"
  validates :name, length:{maximum: 15}
  validates_presence_of :email, :message => "Can't be blank"
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
