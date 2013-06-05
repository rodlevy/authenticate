get '/' do
  # Look in app/views/index.erb
  erb :index

end

post '/create' do
  new_user = User.create(params[:user])
  session[:user_id] = new_user.id
  redirect '/secret_page'

end

post '/login' do
  @user = User.authenticate(params[:user])
  if @user
     session[:user_id] = @user.id
    erb :secret_page
  else
    redirect to '/'
  end
end

get '/secret_page' do
  if current_user
    erb :secret_page
  else 
    redirect '/'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end







