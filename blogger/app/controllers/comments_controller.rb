class CommentsController < ApplicationController
	include CommentsHelper

	def create
		# pull our form data from params, strongly
		@comment = Comment.new(comment_params)
		# mass assignment protection
		@comment.article_id = params[:article_id]
		@comment.save

		# redirect to article page for the article assoiated with this comment 
		redirect_to article_path(@comment.article)
	end
end
