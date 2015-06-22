class Answer < ActiveRecord::Base
	belongs_to :problem
	belongs_to :user

  #------------ START URL friendly -----------#
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged


  def slug_candidates
    [
      :answer,
      [:answer, Answer.count + 1]
    ]
  end
end
