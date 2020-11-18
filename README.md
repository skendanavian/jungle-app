# Jungle

Jungle is a small scale e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. The basic outline for this project was provided and I was challenged to implement a number of features and fixes with limited direction and having zero prior experience with Ruby or Rails.

The features that I implemented include:

- Authentication required to access the admin pages.
- Fixed the price displays to be consistent throughout the site
- Added an order confirmation page which displays the customer's order and email
- Added sold out badge and disabled ability to add an item to the cart when inventory is empty.
- Added About page
- Added registration and login pages, including all backend logic and form validation
- Added RSPEC and Capybara tests
- Added admin dashboard and categories page allowing administrators to add new product categories
- Cleaned up the UI and added some thematic branding throughout the site.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
