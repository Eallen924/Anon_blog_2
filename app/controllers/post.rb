
get '/post/new' do
  @post = Post.new
  erb :edit
end

post '/post/create' do
	@post = Post.new(params[:post])
end

get '/post/preview' do
  @post = Post.find(params[:id])
end

