
require_relative '../../config/environment'
enable :sessions

require 'byebug'

#VIEW COMMENTS
get '/users/:id/comments' do
	@user = User.find(params[:id])
	@comments = @user.comments
	erb :stats
end



# CREATE NEW POST

post '/users/:id/posts/create' do
	# byebug
	@user = User.find(params[:id])
	@post = Post.create(post: params["post"], user_id: params[:id])


	if @post.save
		redirect to "/users/#{@user.id}" #TO SEE THE WHOLE LIST OF POST
	else
		@msg = "Invalid or empty post"
		redirect to "/users/#{@user.id}"
	end
end

#READ - SHOW
get '/users/:id/posts/:post_id' do
	@user = User.find(params[:id])
	@post = Post.find(params[:post_id])

	@comments = @post.comments
	erb :"post/post_show"
end




# EDIT / UPDATE POST
get '/users/:id/posts/:post_id/edit' do
	@user = User.find(params[:id])
	@post = Post.find(params[:post_id])
	erb :"post/post_edit"
end

put '/users/:id/posts/:post_id/edit' do
	@user = User.find(params[:id])
	@post = Post.find(params[:post_id])
	@post.post = "#{params["post"]}"

	if @post.save
		redirect to "/users/#{@user.id}" #TO SEE THE WHOLE LIST OF POST
	else
		@msg = "Invalid or empty post update"
		redirect to "/users/#{@user.id}"
	end
end

#DELETE POST
delete '/users/:id/posts/:post_id' do
	@user = User.find(params[:id])
 	@post = Post.find(params[:post_id])
	@post.destroy
  	redirect to "/users/#{@user.id}"
end


