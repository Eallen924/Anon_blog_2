
get '/user/create' do
  erb :create_user, layout: !request.xhr?
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/user/create' do
  # url = Gravatar.new("generic@example.com").image_url
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect to "/user/profile/#{@user.id}"
  else
    redirect to '/'
  end
end

post '/user/update' do
  puts "REFERRER ZOMG!"
  p request.referrer
  current_user.update(params[:user])
  redirect to "/user/profile/#{current_user.id}"
end

post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  p @user
  if @user
    session[:user_id] = @user.id
    redirect to "/user/profile/#{@user.id}"
  else
    @error = "Invalid Login Info. \n Please try again or<a href='/user/create'>Join us</a>."
    erb :list

  end
end

get '/user/profile/:user_id' do
  @user = User.find(params[:user_id])
  if @user && @user.id == current_user.id
    erb :user_profile
  else
    @error = "Page not found... Your mom."
    erb :user_profile
  end
end

get '/user/edit/:user_id' do
  p "*" * 80
  puts "THIS IS THE USER EDIT LINK"
  p params
  @user = User.find(params[:user_id])
  if @user && @user.id == current_user.id
    erb :edit_user
  else
    @error = "Page not found... Your mom."
    erb :user_profile
  end
end

get '/user/posts/:user_id' do
  user = User.find(params[:user_id])
  p user
  @posts = user.posts
  p @posts
  if @posts == nil
    @error = "This user does not have any posts"
  end
  erb :user_posts
end