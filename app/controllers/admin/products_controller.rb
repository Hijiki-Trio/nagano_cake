class Admin::ProductsController < ApplicationController

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path
  end
  
  def new
    @product = Product.new
  end
    
  def index
  end

  def show
  end
  
 private
 
 def product_params
   params.require(:products).permit(:name, :detail, :image_id, :price)
 end

end

