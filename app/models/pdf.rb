class Pdf
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps
  has_mongoid_attached_file :document,  styles: { :thumbnail =>"200x200>"}
  validates_attachment_content_type :document, :content_type =>[ 'application/pdf', 'application/msword', 'text/plain' ]
  field :pinned, type: Boolean, default: false
  field :pdfname, type: String
  validates :pdfname, uniqueness: true

  has_and_belongs_to_many :users
end
