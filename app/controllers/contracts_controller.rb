class ContractsController < ApplicationController
  def index
    @contracts = Contract.all.order(created_at: :desc)
  end

  def show
    @contract = Contract.find params[:id]
  end

end
