get '/post/create' do
  erb :create_post
end

post '/post/create' do
  @post = Post.postify(params[:post])
  if @post
  	redirect "/user/posts/#{current_user.id}"
  else
  	@error = " :( sad red Panda :( "
  end
end

get '/post/preview' do
  @post = Post.find(params[:id])
end

get '/post/edit/:id' do
  @post = Post.find(params[:id])
  erb :edit_post
end

post '/post/update/:id' do
  @post = Post.find(params[:id])
  tags
  add_tags_to_post
  p params
  @post.save!
  redirect "/view/#{@post.id}"
end

post '/post/delete/:id' do
  Post.find(params[:id]).delete
  redirect '/'
end