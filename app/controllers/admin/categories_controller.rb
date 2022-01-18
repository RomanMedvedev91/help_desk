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

    def edit
      @category = Category.find params[:id]
    end
  
    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to [:admin, :categories], notice: "Category Updated"
      else
        render :edit
      end
    end
  
    def destroy
      @category = Category.find params[:id]
      @category.destroy
      redirect_to [:admin, :categories], notice: 'Category deleted!'
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
