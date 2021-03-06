class Admin::CategoriesController < Admin::BaseController
 
   def index
     @category = Category.order(name: :asc).all
     
   end
 
   def new
     @category = Category.new
   end
 
   def create
     @category = Category.new(category_params)
     puts @category.inspect
 
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