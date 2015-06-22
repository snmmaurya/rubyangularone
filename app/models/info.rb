class Info < ActiveRecord::Base
	belongs_to :user
  before_validation :eliminate_white_spaces
	CONTACT_FORMAT = /[+][0-9]/
    
	validates :fname, presence: true
	# validates :contact, presence: true, format: {with: CONTACT_FORMAT}, length: {minimum: 13, maximum: 13}
	# validates :gender, presence: true
	# validates :martial_status, presence: true
	# validates :about_yourself, presence: true
	# validates :address,  presence: true

	validates_associated :user

  def eliminate_white_spaces
    self.about_yourself = self.about_yourself.strip
  end  
end
