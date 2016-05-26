class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  has_mongoid_attached_file :avatar, :styles => { :medium =>"500x500>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  field :name, type: String
  field :jobtitle, type: String
  field :skills, type: String
  field :gender, type: String
  field :sexuality, type: String
  field :email, type: String
  field :phone, type: String
  field :bio, type: String
  field :admin, type: Boolean, default: false
  has_many :posts


  validates_presence_of :name, :message => "Can't be blank"
  validates :name, length:{maximum: 35}
  validates_presence_of :email, :message => "Can't be blank"
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@easycarewater\.com\z/, message: "must be a easycarewater employee" }
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String
  before_save { |user| user.admin = true if User.count == 0 }
  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
end
