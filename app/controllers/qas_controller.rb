class QasController < ApplicationController
  def index
    @qas = Qa.all.order(created_at: :desc)
  end

  def show
    @qa = Qa.find params[:id]
  end

end
