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
      @user_type = UserType.new(user_type_params)
  
      if @user_type.save
        redirect_to [:admin, :user_types], notice: 'User Type created!'
      else
        render :new
      end
    end

    def show
      @user_type = UserType.find params[:id]
    end

    def edit
      @user_type = UserType.find params[:id]
    end
  
    def update
      @user_type = UserType.find(params[:id])
      if @user_type.update(user_type_params)
        redirect_to [:admin, :user_types], notice: "User Type Updated"
      else
        render :edit
      end
    end
  
    def destroy
      @user_type = UserType.find params[:id]
      @user_type.destroy
      redirect_to [:admin, :user_types], notice: 'User Type deleted!'
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
