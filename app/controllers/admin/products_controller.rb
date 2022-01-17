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
