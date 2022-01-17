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
      @cticket_status_code = TicketStatusCode.new(ticket_priority_params)
  
      if @ticket_status_code.save
        redirect_to [:admin, :ticket_status_codes], notice: 'Ticket Status Code created!'
      else
        render :new
      end
    end

    def show
      @ticket_status_code = TicketStatusCode.find params[:id]
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
