class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
 
   def index
     @category = Category.order(name: :asc).all
     
   end
   def show
  @category = Category.all
   end
 
   def new
     @category = Category.new
   end
 
   def create
     @category = Category.new(category_params)
     puts @category.all
 
     if @category.save
       redirect_to [:admin, :categories], notice: 'Category created!'
     else
       render :new
     end
   end
 
   private
 
   def category_params
     params.require(:category).permit(
       :id,
       :name
     )
   end
 
 end