class Pdf
  include Mongoid::Document
  include Mongoid::Paperclip
  has_mongoid_attached_file :document,  styles: { :thumbnail =>"200x200>"}
  validates_attachment_content_type :document, :content_type =>[ 'application/pdf', 'application/msword', 'text/plain' ]

  field :pdfname, type: String
  validates :pdfname, uniqueness: true
end
