class LivesController < ApplicationController
  def index
    #---------------------- Polymorphic Association -------------------#
    # Teacher.first.images.build(image: "1.jpg")
    # Teacher.last.images.build(image: "2.jpg")
    # Student.first.images.build(image: "3.jpg")
    # Student.first.images.build(image: "1.jpg")

    # Teacher.first.image.count #1
    # Teacher.last.image.count #1
    # Student.first.count #2
    # Image.count #4
    #---------------------------- END ----------------------------------#
    # @comments = Comment.all.map {|comment| Comment.where("comment_id= ? OR id=?", comment.id, comment.id)}
    # render text: @comments.first.first.comment
    # @coms = @comments.map {}
    # binding.pry
    @commentss = ""
    def collect_comments comment
      # binding.pry
      comments = Comment.where("comment_id=? AND id !=?", comment.id, comment.id) #child comments
      if comments.present?
        comments.each do |child_comment|
          collect_comments child_comment
          @commentss += "<div class='container'>#{comment.id} | #{comment.comment_id}</div>"
          # binding.pry
        end
      else
        # @commentss += "<div class='container'>#{comment.id}</div>"
      end
      return @comments
    end

    @comments = Comment.where("comment_id = id").each {|comment| collect_comments(comment)}
    binding.pry
    render text: @commentss.html_safe
    # render text: @comments.first.first.inspect

    # render text: Comment.where("id=comment_id").map do |comment|
    #   "<div class='container'>#{comment.comment}"
    #   while true
    #     child_comment = Comment.find_by(comment_id: comment.id)
    #     child_comment.comment
    #   end
    #   "</div>"
    # end

    # def collect_comments comment=nil

    # end
    # # render text: Comment.order(comment_id: :desc).map {|comment| comment.comment_id}
    # @html = ""
    # @comments = Comment.order(created_at: :desc).order(comment_id: :desc).map do |comment|
    #   if Comment.where("id=? AND comment_id!=?", comment.comment_id, comment.comment_id).present?
    #    "<div style='position:relative;margin:5px;'>#{comment.id} #{comment.comment_id} #{comment.comment}</div>"
    #   else
    #     "<div>#{comment.id} #{comment.comment_id} #{comment.comment}</div>" 
    #   end
    #   # "<div class='container'>#{comment.comment} #{Comment.where(comment_id: comment.id).map { |child_comment| "<div class='child_comment'>#{child_comment.comment} #{child_comment}</div>" }.join}</div>"
    # end.join.html_safe
    # render text: @comments
  end
end