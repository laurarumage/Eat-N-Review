get "/restaurants/new" do
  @restaurant = Restaurant.new
  if logged_in?
    erb :"restaurants/new"
  else
    @message = "You must be logged in to add a new restaurant."
    erb :"sessions/new"
  end
end

post "/restaurants" do
  @restaurant = Restaurant.new(params[:restaurant])
  if logged_in?
    if @restaurant.save
      current_user.created_restaurants << @restaurant
      erb :"restaurants/show"
    else
      erb :"restaurants/new"
    end
  else
    @message = "You must be logged in to add a new restaurant."
    erb :"sessions/new"
  end
end

get "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])
  @review = Review.new
  erb :"restaurants/show"
end

get "/restaurants/:id/edit" do
  if logged_in?
    @restaurant = Restaurant.find(params[:id])
    if current_user.id == @restaurant.creator_id
      erb :"restaurants/edit"
    else
      redirect "/not_authorized"
    end
  else
    @message = "You must be logged in to edit a restaurant created."
    erb :"sessions/new"
  end
end

put "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])
  if current_user.id == @restaurant.creator_id
    @restaurant.update_attributes(params[:restaurant])
    erb :"restaurants/show"
  else
    redirect "/not_authorized"
  end
end

delete "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])
  if current_user.id == @restaurant.creator_id
    @restaurant.destroy
    redirect "/"
  else
    redirect "/not_authorized"
  end
end
