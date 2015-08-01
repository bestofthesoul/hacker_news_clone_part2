
get '/' do
	redirect to '/posts'
end

# READ-INDEX
get '/posts' do
	@posttag =Posttag.all
  @posts = Post.all
	erb :post_all_show
end


#CREATE - NEW
get '/posts/new' do
erb :post_new
end

# READ - SHOW
get '/posts/:id' do
	@post = Post.find(params[:id])
	erb :post_show
end


#DELETE
post '/posts/:id/delete' do
  @post = Post.find params[:id]
  @post.destroy
  # Post.idreset
  redirect to '/'
end


#CREATE - CREATE
post '/posts/new' do

  @post = Post.new(params[:post])
  
  if @post.save
    tag_list = params[:tags].split(",") #in erb form, input is named as tags
    tag_list.each{|x| x.gsub!(" ", "")}
    tag_list.uniq! #remove duplicated entries!!!!!****
    tag_list.each do |tag|
      if Tag.find_by_name(tag).nil?
      tag = Tag.new(name: tag)
      else
      tag = Tag.find_by(name: tag)
      end

      if tag.save
        @post.tags << tag
      end
    end

  else
     redirect to "/"
  end  # Post.idreset

  redirect to "/"
end


# UPDATE-EDIT
get "/posts/:id/edit" do
  @post = Post.find(params[:id])
  erb :post_edit
end

# UPDATE-UPDATE
post '/posts/:id' do

  @post = Post.find(params[:id])
  @post.update(params[:post])
  
  new_tag_array = []
  if @post.save
    tag_list = params[:tag][:name].split(",") #in erb form, input is named as tags
    tag_list.each{|x| x.gsub!(" ", "")}
    tag_list.uniq!
    tag_list.each do |tag|
      if Tag.find_by_name(tag).nil?
      tag = Tag.new(name: tag)
      else
      tag = Tag.find_by(name: tag)
      end

      if tag.save
        new_tag_array << tag
        @post.tags = new_tag_array
      end    
    end
      
    redirect to("/posts/#{@post.id}")
  
  else
     erb :post_edit
  end 
end
