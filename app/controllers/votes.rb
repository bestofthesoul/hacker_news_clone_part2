

#APPLYING AJAX TO IMPLEMENT VOTING ON POSTS
post '/users/:id/posts/:post_id/votes' do
	@user = User.find session[:id]
	@postvote = PostVote.new(post_id: params[:post_id], user_id: params[:id])

	if @postvote.save
		# redirect to "/users/:id/posts/:post_id"
		{count: @user.post_votes.where(post_id: params[:post_id]).count}.to_json
	else
		@msg ="error in voting post"
		# redirect to "/users/:id/posts/:post_id"
		@msg.to_json
	end
end


post '/users/:id/posts/:post_id/comment/:comment_id/votes' do
	@user = session[:id]
	@commentvote = Commentvote.new(comment_id: params[:comment_id], user_id: params[:id])

	@post = Post.find(@commentvote.comment.post.id)

	if @commentvote.save
		redirect to "/users/:id/posts/:post_id/comment/:comment_id"
	else
		@msg ="error in voting comment"
		redirect to  "/users/:id/posts/:post_id/comment/:comment_id"
	end
end