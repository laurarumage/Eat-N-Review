post "/restaurants/:id/reviews" do
  if logged_in?
    @restaurant = Restaurant.find(params[:id])
    rating = params[:rating]
    body = params[:body]
    @review = Review.new(customer_id: current_user.id, restaurant_id: @restaurant.id, rating: rating, body: body)
    if @review.save
      @message = "Thank you for your review."
      redirect "/restaurants/#{@restaurant.id}"
    else
      erb :"restaurants/show"
    end
  else
    @message = "You must be logged in to review a restaurant."
    erb :"restaurants/show"
  end
end
