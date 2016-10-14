class ProductsController < ApplicationController
  def index      
    @products = Product.all
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to @product
    else
      render "new"
    end
  end
  def products_params
    params.require(:product).permit(:name,:price)
  end

  def show
    @product = Product.find(params[:id])
  end
  def search
  end
  def searchable
    searchword = params[:search]
    @data = Product.where(name: searchword)
  end
end

