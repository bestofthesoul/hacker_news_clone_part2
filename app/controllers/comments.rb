require_relative '../../config/environment'
enable :sessions

require 'byebug'

# CREATE - CREATE COMMENT

post '/users/:id/posts/:post_id/comments/create' do
	@comment = Comment.new(comment: params["comment"], user_id: params[:id], post_id: params[:post_id])

	@post = Post.find(params[:post_id])
	if @comment.save
		# @msg = "New Comment is created"
		# redirect to "/users/#{@post.user_id}/posts/#{@post.id}"
		@comment.to_json
	else
		@msg = "Invalid Comment"
		# erb :"post/post_show"
		@msg.to_json
	end

end

# DELETE COMMENT
delete '/users/:id/posts/:post_id/comments/:comment_id' do
	# @user = User.find(params[:id])
  @comment = Comment.find(params[:comment_id])
  @comment.destroy
  redirect to "/users/#{@comment.user_id}/posts/#{@comment.post_id}"
end


# UPDATE EDIT COMMENT
get '/users/:id/posts/:post_id/comments/:comment_id/edit' do
	# @user = User.find(params[:id])
	@comment = Comment.find(params[:comment_id])
	erb :"comment/comment_edit"
end

# UPDATE UPDATE COMMENT
put '/users/:id/posts/:post_id/comments/:comment_id/edit' do
	@user = User.find(params[:id])
	@comment = Comment.find(params[:comment_id])
	@comment.comment = "#{params["comment"]}"
	
	if @comment.save
		@msg = "Comment is updated successfully"
		redirect to "/users/#{@user.id}/posts/#{@comment.post_id}"
	else
		@msg = "Invalid Comment"
		erb :"post/post_show"
	end
end
