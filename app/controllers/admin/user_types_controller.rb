module Admin
  class UserTypesController < ApplicationController
    #require authorization
    before_filter :authorize

    def index
      @user_types = UserType.all.order(created_at: :desc)
    end

    def new
      @user_type = UserType.new
    end
  
    def create
      @User_type = UserType.new(user_type_params)
  
      if @user_type.save
        redirect_to [:admin, :user_types], notice: 'User Type created!'
      else
        render :new
      end
    end

    def show
      @user_type = UserType.find params[:id]
    end

    private
    def user_type_params
      params.require(:user_type).permit(
        :code,
        :description
      )
    end

  end
end
