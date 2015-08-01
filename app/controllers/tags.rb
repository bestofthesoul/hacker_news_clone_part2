

get '/tags/:tag_name' do
  @tag= Tag.find_by(name: params[:tag_name])
  @posts = @tag.posts
  erb :tag_show
end
