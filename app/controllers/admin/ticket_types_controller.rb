module Admin
  class TicketTypesController < ApplicationController
    #require authorization
    before_filter :authorize

    def index
      @ticket_types = TicketType.all.order(created_at: :desc)
    end

    def new
      @ticket_type = TicketType.new
    end
  
    def create
      @ticket_type = TicketType.new(ticket_type_params)
  
      if @ticket_type.save
        redirect_to [:admin, :ticket_types], notice: 'Ticket Type created!'
      else
        render :new
      end
    end

    def show
      @ticket_types = TicketType.find params[:id]
    end

    def edit
      @ticket_type = TicketType.find params[:id]
    end
  
    def update
      @ticket_type = TicketType.find(params[:id])
      if @ticket_type.update(ticket_type_params)
        redirect_to [:admin, :ticket_types], notice: "Ticket Type Updated"
      else
        render :edit
      end
    end
  
    def destroy
      @ticket_type = TicketType.find params[:id]
      @ticket_type.destroy
      redirect_to [:admin, :ticket_types], notice: 'Ticket Type deleted!'
    end

    private
    def ticket_type_params
      params.require(:ticket_type).permit(
        :code,
        :description
      )
    end

  end
end
