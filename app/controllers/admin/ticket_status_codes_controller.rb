module Admin
  class TicketStatusCodesController < ApplicationController
    #require authorization
    before_filter :authorize

    def index
      @ticket_status_codes = TicketStatusCode.all.order(created_at: :desc)
    end

    def new
      @ticket_status_code = TicketStatusCode.new
    end
  
    def create
      @ticket_status_code = TicketStatusCode.new(ticket_status_code_params)
  
      if @ticket_status_code.save
        redirect_to [:admin, :ticket_status_codes], notice: 'Ticket Status Code created!'
      else
        render :new
      end
    end

    def show
      @ticket_status_code = TicketStatusCode.find params[:id]
    end

    def edit
      @ticket_status_code = TicketStatusCode.find params[:id]
    end
  
    def update
      @ticket_status_code = TicketStatusCode.find(params[:id])
      if @ticket_status_code.update(ticket_status_code_params)
        redirect_to [:admin, :ticket_status_codes], notice: "Ticket Status Updated"
      else
        render :edit
      end
    end
  
    def destroy
      @ticket_status_code = TicketStatusCode.find params[:id]
      @ticket_status_code.destroy
      redirect_to [:admin, :ticket_status_codes], notice: 'Ticket Status deleted!'
    end
  
    private
    def ticket_status_code_params
      params.require(:ticket_status_code).permit(
        :code,
        :description
      )
    end

  end
end
