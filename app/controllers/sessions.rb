get "/sessions/new" do
  erb :"sessions/new"
end

post "/sessions" do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/"
  else
    @message = "Your email address and/or password were incorrect"
    erb :"sessions/new"
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect "/"
end
