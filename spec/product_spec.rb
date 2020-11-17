require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before :each do
     @category = Category.new
      @category.name = "clothes"
      @category.save
     end

      it "creates new product" do
        @product = Product.create(name: "shirt", price: 3000, quantity: 10, category_id: @category.id)
        expect(@product.errors.full_messages).to eq([]) 
      end

      it "validates presence of name" do
        @product = Product.create(name: nil, price: 3000, quantity: 10, category_id: @category.id)
        expect(@product.errors.full_messages).to eq(["Name can't be blank"]) 
    end
      it "validates presence of price" do
        @product = Product.create(name: "shirt", price: nil, quantity: 10, category_id: @category.id)
        expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"]) 
    end
      it "validates presence of name" do
        @product = Product.create(name: "shirt", price: 3000, quantity: nil, category_id: @category.id)
        expect(@product.errors.full_messages).to eq(["Quantity can't be blank"]) 
    end
      it "validates presence of name" do
        @product = Product.create(name: "shirt", price: 3000, quantity: 10, category_id: nil)
        expect(@product.errors.full_messages).to eq(["Category can't be blank"]) 
    end
  end
end
