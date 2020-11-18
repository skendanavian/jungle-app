# Jungle

Jungle is a small scale e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. The application displays products which can be added to a shopping cart for later purchase. The customer can then checkout and pay using the stripe API. Administrators can access admin pages to view inventory, products, and categories. They can also add/remove new products and categories here.

The basic outline for this project was provided by Lighthouse Labs and I was challenged to implement a number of features and fixes with very little outside direction and having zero prior experience with Ruby or Rails.

The new features and fixes implemented include:

- Authenticating administrators before accessing admin pages.
- Fixed the price formatting to be consistent throughout the site
- Added an order confirmation page which displays the customer's order and email
- Added Stripe payment functionality
- Added sold out badge and disabled ability to add an item to the cart when inventory is empty.
- Added About page
- Added registration and login pages, including all backend logic and form validation
- Added RSPEC and Capybara tests
- Added admin dashboard and categories page allowing administrators to add new product categories
- Cleaned up the UI and added some thematic branding throughout the site.

## Project Photos

<p align='center'>Home Page - Products</p>
<p align="center">
<img src="https://github.com/skendanavian/jungle-app/blob/master/docs/product-home-page.png?raw=true" height="400">
</p>
<p align='center'>Shopping Cart <br> (test credentials)</p>
<p align="center">
<img src="https://github.com/skendanavian/jungle-app/blob/master/docs/shopping-cart.png?raw=true" height="400">
</p>
<p align='center'>Payment</p>
<p align="center">
<img src="https://github.com/skendanavian/jungle-app/blob/master/docs/stripe-payment-page.png?raw=true" height="400">
</p>
<p align='center'>Order Confirmation</p>
<p align="center">
<img src="https://github.com/skendanavian/jungle-app/blob/master/docs/order-confirmation-page.png?raw=true" height="400">
</p>
<p align='center'>Register/Login View</p>
<p align="center">
<img src="https://github.com/skendanavian/jungle-app/blob/master/docs/signup-page.png?raw=true" height="400">
</p>
<p align='center'>Admin Dashboard</p>
<p align="center">
<img src="https://github.com/skendanavian/jungle-app/blob/master/docs/admin-dashboard.png?raw=true" height="400">
</p>
<p align='center'>Responsive - Mobile Example</p>
<p align="center">
<img src="https://github.com/skendanavian/jungle-app/blob/master/docs/responsive-mobile-view.png?raw=true" height="400">
</p>

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

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
