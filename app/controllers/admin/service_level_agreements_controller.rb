module Admin
  class ServiceLevelAgreementsController < ApplicationController
    #require authorization
    before_filter :authorize

    def index
      @service_level_agreements = ServiceLevelAgreement.all.order(created_at: :desc)
    end

    def new
      @service_level_agreement = ServiceLevelAgreement.new
    end
  
    def create
      @service_level_agreement = ServiceLevelAgreement.new(service_level_agreement_params)
  
      if @service_level_agreement.save
        redirect_to [:admin, :service_level_agreements], notice: 'Service Level Agreement created!'
      else
        render :new
      end
    end

    def show
      @service_level_agreement = ServiceLevelAgreement.find params[:id]
    end

    def edit
      @service_level_agreement = ServiceLevelAgreement.find params[:id]
    end
  
    def update
      @service_level_agreement = ServiceLevelAgreement.find(params[:id])
      if @service_level_agreement.update(service_level_agreement_params)
        redirect_to [:admin, :service_level_agreements], notice: "SLA Updated"
      else
        render :edit
      end
    end
  
    def destroy
      @service_level_agreement = ServiceLevelAgreement.find params[:id]
      @service_level_agreement.destroy
      redirect_to [:admin, :service_level_agreements], notice: 'SLA deleted!'
    end
  
    private
    def service_level_agreement_params
      params.require(:service_level_agreement).permit(
        :code,
        :description,
        :business_days,
        :business_hours
      )
    end

  end
end
