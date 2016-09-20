get "/" do
  @restaurants = Restaurant.all
  erb :index
end

get "/not_authorized" do
  erb :"not_authorized"
end
