class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :github, :twitter]

  # validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  acts_as_taggable

  # validates :name, presence: true, unless: -> {from_omniauth?}
  validates :username, presence: true

  belongs_to :role
  has_many :problems, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :infos, dependent: :destroy

  has_many :employments, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :developments, dependent: :destroy
  has_many :technologies, dependent: :destroy
  has_many :apis, dependent: :destroy
  has_many :downloads, dependent: :destroy
  has_many :portfolios, dependent: :destroy
  has_many :posts, dependent: :destroy

  # validates_associated :infos
  validates :username, presence: true
  #File uploading through carrierwave gem
  mount_uploader :image, FileUploader
  mount_uploader :resume_pdf, FileUploader
  mount_uploader :resume_doc, FileUploader

  accepts_nested_attributes_for :infos, allow_destroy: true, reject_if: proc { |attributes| attributes["value"].blank? }

  attr_accessor :login

  enum role: {administrator: 1, user: 2}



  #------------ START URL friendly -----------#
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged


  def slug_candidates
    [
      :username,
      [:username, User.count + 1]
    ]
  end
  
  def self.find data
    data.to_i ==0 ? find_by_username(data) : super
  end
  #------------ END URL friendly -------------#

  # def email_verified?
  #   self.email && self.email !~ TEMP_EMAIL_REGEX
  # end

  #-- Allow user to signin using email/username
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  def admin?
    (self && self.role_id == 1) ? true : false
  end  

  def self.from_omniauth(auth)
    user = self.find_by(provider: auth.provider, uid: auth.uid)
    if user.present? #Authenticated user exists.
      user
    else
      user = self.find_by(email: auth.info.email)
      if user.present? #Authenticated user's email exists? then map to the authenticated account
        user.provider = auth.provider
        user.uid = auth.uid
        user.remote_image_url = image_for(auth)
        user.save!
        user
      else #Authenticated user does not exist, create new user.        
        user = self.new
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = (auth.provider=="twitter") ? "#{auth.uid}@snmmaurya.com" : auth.info.email
        user.username = self.create_username(((auth.provider=="twitter") ? auth.info.name.split(" ").first : auth.info.first_name))
        user.remote_image_url = image_for(auth)
        user.password = Devise.friendly_token[0,20]
        user.skip_confirmation!
        user.save!
        info = user.infos.first_or_initialize
        info.fname = (auth.provider=="twitter") ? (auth.info.name.split(" ").first) : auth.info.first_name
        info.lname = (auth.provider=="twitter") ? (auth.info.name.split(" ").last) : auth.info.last_name
        info.save!
        user
      end
    end
  end  

  # def self.from_omniauth(auth)
  #   auth.uid = "U#{auth.uid}"
  #   where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.email = auth.info.email
  #     user.username = auth.uid
  #     user.remote_image_url = image_for(auth)
  #     user.password = Devise.friendly_token[0,20]
  #     user.skip_confirmation!
  #     user.save
  #     info = user.infos.first_or_initialize
  #     info.fname = auth.info.first_name
  #     info.lname = auth.info.last_name
  #     info.save
  #   end
  # end

  # def self.from_twitter_omniauth(auth)
  #   auth.uid = "U#{auth.uid}"
  #   where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.email = "#{auth.uid}@snmmaurya.com"
  #     user.username = auth.uid
  #     user.remote_image_url = image_for(auth)
  #     user.password = Devise.friendly_token[0,20]
  #     user.skip_confirmation!
  #     user.save
  #     info = user.infos.first_or_initialize
  #     info.fname = auth.info.name.split(" ").first
  #     info.lname = auth.info.name.split(" ").last
  #     info.save
  #   end
  # end

  def from_omniauth?
    provider && uid
  end

  def self.image_for auth
    image="no-img.jpg"
    case auth.provider.to_sym      
      when :facebook
        image = "#{auth.info.image.gsub('http://','https://')}/?type=large"
      when :twitter
        image = auth.info.image.gsub('http://','https://')
      when  :github  
        image = "#{auth.info.image.gsub('http://','https://')}&sz=280"
      when :google_oauth2
        image = "#{auth.info.image.gsub('http://','https://')}&sz=280"
    end
    return image
  end

  def self.omniauth_new_user?(auth)
    self.where("uid= ? AND provider= ? OR email= ?", auth.uid, auth.provider, auth.info.email).blank?
  end

  def self.create_username(username)
    if self.find_by(username: username).present?
      create_username "#{username}#{rand(0..9)}"
    else
      return username
    end
  end

  def full_name; info = self.infos.last; "#{info.fname} #{info.lname}"; end

  # validates :username, format: {with: /\A[a-zA-Z\d\-\_]*\w+\Z/i, message: "should contain alphanumeric characters or dashes or underscores and cannot begin and end with a dash or underscore"}, presence: true, uniqueness: true
  # validates :email, uniqueness: true
  # validates :phone_no, format: {with:  /\d[0-9]\)*\z/ }, if: "password_confirmation.nil? && phone_no.present?" 
end


