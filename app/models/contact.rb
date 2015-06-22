class Contact < ActiveRecord::Base
	validates :name, :message, presence: true, length: {maximum: 250}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i	
	validates :message, length: { minimum: 10}
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, length: {maximum: 250}
end
