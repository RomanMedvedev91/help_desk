module Admin
  class CategoriesController < ApplicationController

    #require authorization
    before_filter :authorize

    def index
      @categories = Category.all.order(created_at: :desc)
    end

    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
  
      if @category.save
        redirect_to [:admin, :categories], notice: 'Category created!'
      else
        render :new
      end
    end
  
    def show
      @category = Category.find params[:id]
    end

    private
    def category_params
      params.require(:category).permit(
        :code,
        :description
      )
    end
  
  end
end


  

