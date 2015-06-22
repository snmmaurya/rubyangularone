class Book < ActiveRecord::Base
	mount_uploader :image, FileUploader
	has_many :lessions

  #------------ START URL friendly -----------#
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged


  def slug_candidates
    [
      :title,
      [:title, Book.count + 1]
    ]
  end
end