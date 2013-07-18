get '/post/preview' do
  @post = Post.find(params[:id])
end

