require 'rails_helper'
require 'database_cleaner'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
   
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
      end
    end

    scenario "They can click on product details and go to detail page" do
      # ACT
      visit root_path
     
      first(:link, "Details").click
      sleep(1)
  
      # DEBUG / VERIFY
      save_screenshot 'product-page.png'
      expect(page).to have_text 'Name', count: 1
      expect(page).to have_text 'Quantity', count: 1
      expect(page).to have_css '.products-show', count: 1 
    end

end
