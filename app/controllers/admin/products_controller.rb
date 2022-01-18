module Admin
  class ProductsController < ApplicationController
    #require authorization
    before_filter :authorize

    def index
      @products = Product.all.order(created_at: :desc)
    end

    def new
      @product = Product.new
      @categories = Category.all
    end
  
    def create
      @product = Product.new(product_params)
  
      if @product.save
        redirect_to [:admin, :products], notice: 'Product created!'
      else
        render :new
      end
    end
  
    def show
      @product = Product.find params[:id]
    end

    def edit
      @product = Product.find params[:id]
      @categories = Category.all
    end
  
    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to [:admin, :products], notice: "Product Updated"
      else
        render :edit
      end
    end
  
    def destroy
      @product = Product.find params[:id]
      @product.destroy
      redirect_to [:admin, :products], notice: 'Product deleted!'
    end
  

    private
    def product_params
      params.require(:product).permit(
        :category_id,
        :code,
        :description,
        :model
      )
    end

  end
end
