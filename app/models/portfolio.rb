class Portfolio < ActiveRecord::Base
	#File uploading through carrierwave gem
	mount_uploader :image, FileUploader

	belongs_to :user

	# URLFORMAT = /(?:http(?:s)?:\/\/)?(?:www\.)?(?:[\w-]*)\.[a-z]{2,6}/
	# validates :url, presence: true, format: {with: URLFORMAT}
	# validates :description, presence: true
	# validates :image, presence: true
	# validates :title, presence: true
end
