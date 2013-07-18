get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/new' do
  @post = Post.new
  erb :edit
end

get '/edit/:id' do
  @post = Post.find(params[:id])
  # @post = Post.new
  #tag_names
  
  erb :edit

end

post '/delete/:id' do
  Post.find(params[:id]).delete 
  redirect '/list'

end

get '/list' do 
  @posts = Post.first(10)
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

post '/removetag/:id' do
  p params
end
