get '/create_user' do
  # Look in app/views/index.erb
  erb :create_user
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/create_user' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect to "/user_profile/#{@user.id}"
  else
    redirect to '/'
  end
end

post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect to "/user_profile/#{@user.id}"
  else
    @error = 'Invalid Login Info'
  end
end

get '/user_profile/:user_id' do 
  @user = User.find(params[:user_id]) 
  if @user.id == current_user.id
    erb :user_profile
  else
    @error = "Page not found... Your mom."
    erb :user_profile
  end
end
