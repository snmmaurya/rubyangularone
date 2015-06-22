class Problem < ActiveRecord::Base
	has_many :answers, dependent: :destroy
	belongs_to :user
	belongs_to :solution

	# extend FriendlyId
	# friendly_id :problem

	validates :problem, uniqueness: { case_sensitive: false }, presence: true
	validates :problem, format: {with: /[^\?]/, message: "Question should not contain question mark" }

  #------------ START URL friendly -----------#
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged


  def slug_candidates
    [
      :problem,
      [:problem, Problem.count + 1]
    ]
  end
end



# searchable do
#     text :problem, :body
#     text :comments do
#       comments.map { |comment| comment.body }
#     end

#     boolean :featured
#     integer :blog_id
#     integer :author_id
#     integer :category_ids, :multiple => true
#     double  :average_rating
#     time    :published_at
#     time    :expired_at

#     string  :sort_title do
#       title.downcase.gsub(/^(an?|the)/, '')
#     end
#   end