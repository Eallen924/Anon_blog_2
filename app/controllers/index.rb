get '/' do
  # Look in app/views/index.erb
  redirect'/list'
end



get '/edit/:id' do
  @post = Post.find(params[:id])
  erb :edit

end

post '/delete/:id' do
  Post.find(params[:id]).delete
  redirect '/list'

end

get '/list' do
  @posts = Post.first(3)
  erb :list
end

get '/view/:id' do
  @post = Post.find(params[:id])
  erb :view
end

post '/update/:id' do
  @post = Post.find(params[:id])
  tags
  add_tags_to_post
  p params
  @post.save!
  redirect "/view/#{@post.id}"
end

post '/remove_tag' do
  sad_tag = PostTag.where('post_id = ? AND tag_id = ?', params[:post_id], params[:tag_id])
  PostTag.find(sad_tag.first.id).destroy
  redirect "edit/#{params[:post_id]}"
end

