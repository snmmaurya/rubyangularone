class Solution < ActiveRecord::Base
	has_many :problems, dependent: :destroy

	#File uploading through carrierwave gem
	mount_uploader :image, FileUploader

	#------------ START URL friendly -----------#
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged


  def slug_candidates
    [
      :solution,
      [:solution, Solution.count + 1]
    ]
  end
end

#https://www.youtube.com/watch?v=vk0uat6WBL0&list=PL7c3uEfXWBge_aD6kJhhR2w7C-_azqxvX&index=2
#https://www.youtube.com/watch?v=jtHWFWgKCBM&list=PL7c3uEfXWBge_aD6kJhhR2w7C-_azqxvX&index=10