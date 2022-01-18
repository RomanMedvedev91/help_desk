module Admin
  class QasController < ApplicationController
    #require authorization
    before_filter :authorize

    def index
      @qas = Qa.all.order(created_at: :desc)
    end

    def new
      @qa = Qa.new
      @qa_categories = QaCategory.all.order(created_at: :desc)
    end

    def create
      @qa = Qa.new(qa_params)
  
      if @qa.save
        redirect_to [:admin, :qas], notice: 'Q&A created!'
      else
        render :new
      end
    end

    def show
      @qa = Qa.find params[:id]
    end

    def edit
      @qa = Qa.find params[:id]
      @qa_categories = QaCategory.all  
    end
  
    def update
      @qa = Qa.find(params[:id])
      if @qa.update(qa_params)
        redirect_to [:admin, :qas], notice: "QA Updated"
      else
        render :edit
      end
    end
  
    def destroy
      @qa = Qa.find params[:id]
      @qa.destroy
      redirect_to [:admin, :qas], notice: 'QA deleted!'
    end
  
    private
    def qa_params
      params.require(:qa).permit(
        :qa_category_id,
        :problem,
        :solution
      )
    end

  end
end






