get '/' do
  @posts = Post.all
  erb :home
end

get '/edit/:id' do
  @post = Post.find(params[:id])
  erb :edit_post
end


get '/view/:id' do
  @post = Post.find(params[:id])
  erb :view
end

post '/remove_tag' do
  sad_tag = PostTag.where('post_id = ? AND tag_id = ?', params[:post_id], params[:tag_id])
  PostTag.find(sad_tag.first.id).destroy
  redirect "edit/#{params[:post_id]}"
end

