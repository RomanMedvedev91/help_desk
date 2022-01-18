module Admin
  class QaCategoriesController < ApplicationController
    #require authorization
    before_filter :authorize

    def index
      @qa_categories = QaCategory.all.order(created_at: :desc)
    end

    def new
      @qa_category = QaCategory.new
    end
  
    def create
      @qa_category = QaCategory.new(qa_category_params)
  
      if @qa_category.save
        redirect_to [:admin, :qa_categories], notice: 'Q&A Category created!'
      else
        render :new
      end
    end

    def show
      @qa_category = QaCategory.find params[:id]
    end

    def edit
      @qa_category = QaCategory.find params[:id]
    end
  
    def update
      @qa_category = QaCategory.find(params[:id])
      if @qa_category.update(qa_category_params)
        redirect_to [:admin, :qa_categories], notice: "QA Category Updated"
      else
        render :edit
      end
    end
  
    def destroy
      @qa_category = QaCategory.find params[:id]
      @qa_category.destroy
      redirect_to [:admin, :qa_categories], notice: 'QA Category deleted!'
    end
  

    private
    def qa_category_params
      params.require(:qa_category).permit(
        :code,
        :description
      )
    end
  end
end
