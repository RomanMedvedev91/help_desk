class ContractsController < ApplicationController
  #require authorization
  before_filter :authorize

  def index
    @contracts = Contract.all.order(created_at: :desc)
  end

  def new
    @contract = Contract.new
    @service_level_agreements = ServiceLevelAgreement.all
  end

  def create
    @contract = Contract.new(contract_params)

    if @ticket.save
      redirect_to [:contracts], notice: 'Contract created!'
    else
      render :new
    end
  end

  def show
    @contract = Contract.find params[:id]
  end

  private
  def contract_params
    params.require(:contract).permit(
      :user_id,
      :service_level_agreement_id,
      :sla_valid_start_date,
      :sla_valid_end_date
    )
  end

end
