# Eat N' Review

A website for reviewing restaurants.

## Preview

![Screenshot of home page](/readme-images/home.png "Screenshot: Home page")

Site visitors not logged-in can browse featured restaurants and restaurant review details.

![Screenshot of restaurant details](/readme-images/restaurant.png "Screenshot: Restaurant details")

Logged-in users can add new restaurants to the site and review each restaurant once.

![Screenshot of adding a review](/readme-images/add-review.png "Screenshot: Add review")

## Getting Started

```
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec shotgun
```