class Admin::ProductsController < ApplicationController

  before_action :authenticate_admin!

  def create
    @product = Product.new(product_params)
    if @product.save
     redirect_to admin_product_path(@product.id)
    else
     @genres = Genre.all
     render 'new'
    end
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def index
    @products = Product.page(params[:page]).per(10)
    @genres = Genre.all

  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
     redirect_to admin_product_path(@product)
    else
     render :edit
    end
  end


 private

  def product_params
    params.require(:product).permit(:name, :detail, :image, :price, :genre_id, :is_active)
  end
end