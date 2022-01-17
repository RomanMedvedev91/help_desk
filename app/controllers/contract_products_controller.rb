class ContractProductsController < ApplicationController
  def index
    @contract_products = ContractProduct.all.order(created_at: :desc)
  end

  def show
    @contract_product = ContractProduct.find params[:id]
  end

end
