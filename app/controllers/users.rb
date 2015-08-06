require_relative '../../config/environment'
enable :sessions

require 'byebug'

# READ
get '/users' do
	if session[:id] != nil # ALREADY LOGGED IN
		@user = User.find(session[:id])
		erb :"user/user_show"
	else
		erb :"user/user_all"
	end
end

get '/users/new' do
	@user = User.new
	erb :"user/user_all"
end


# CREATE NEW ACCOUNT - AUTO SIGNED IN AFTER CREATION
post '/users/create' do
	@user = User.new(params[:user])
	if @user.save # if everything is keyed in perfectly, passed validations of email n password
		@msg = "This is your new account logged in page"
		session[:id] = @user.id
		redirect to "/users/#{@user.id}"
	else
		@msg = "Invalid Email/ Password!"	
		erb :"user/user_all"
	end	
end

# LOG IN
post '/users/login' do
	#User key in email, search the @user then check if password is correct
	@user = User.find_by(email: params[:email])
	
	# @user = User.find_by_email(params["email"])
	@password = params["password"]

	if @user.nil? || @user.check_password(@password) == false
		@msg = "User NOT found in system OR Incorrect password."
		erb :"user/user_all"
	elsif @user.check_password(@password) == true
		session[:id] = @user.id
		redirect to "/users/#{@user.id}"
		else
		erb :"user/user_edit"
	end
end



# AFTER LOGGED IN - SHOW USER FUNCTION ERB
get '/users/:id' do
	if session[:id] != nil #means email IS FOUND, password IS CORRECT
		@user = User.find(params[:id])
		@posts = Post.all

		erb :"user/user_show"
	else
		erb :"user/user_all"
	end
end

# EDIT USER ACCOUNT INFO
get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :"user/user_edit"
end

put '/users/:id/edit' do
	@user = User.find(params[:id])
	@user.update(params[:user])
	if @user.save
		@msg = "Updated successfully! You can log in again"
		erb :"user/user_all"
	else
		@msg = "Invalid email or password"
		erb :"user/user_all"
	end
end


# LOG-OUT
post '/users/logout' do
	session.clear
	@error = "Logout successfully..."
	erb :"user/user_all"
end

# DELETE ACCOUNT
delete '/users/:id' do
  @user = User.find(params[:id])
  @user.destroy
  session.clear
  redirect to '/users'
end