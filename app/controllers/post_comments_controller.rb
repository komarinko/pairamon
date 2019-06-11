class PostCommentsController < ApplicationController
	def create
	    user = User.find(params[:user_id])
	    comment = current_user.post_comments.new(post_comment_params)
	    comment.user_id = user.id
	    comment.save
	    redirect_to user_path(user.id)
	end

	private
	def post_comment_params
	  params.require(:post_comment).permit(:user_id,
	                      :post_image_id,
	                      :comment)
	end
end
