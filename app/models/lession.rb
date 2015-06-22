class Lession < ActiveRecord::Base
	belongs_to :book

  #------------ START URL friendly -----------#
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged


  def slug_candidates
    [
      :title,
      [:title, Lession.count + 1]
    ]
  end
end
