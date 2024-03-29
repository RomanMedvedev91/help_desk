module Admin
  class TicketPrioritiesController < ApplicationController
    #require authorization
    before_filter :authorize


    def index
      @ticket_priorities = TicketPriority.all.order(created_at: :desc)
    end

    def new
      @ticket_priority = TicketPriority.new
    end
  
    def create
      @ticket_priority = TicketPriority.new(ticket_priority_params)
  
      if @ticket_priority.save
        redirect_to [:admin, :ticket_priorities], notice: 'Ticket Priority created!'
      else
        render :new
      end
    end

    def show
      @ticket_priority = TicketPriority.find params[:id]
    end

    def edit
      @ticket_priority = TicketPriority.find params[:id]
    end
  
    def update
      @ticket_priority = TicketPriority.find(params[:id])
      if @ticket_priority.update(ticket_priority_params)
        redirect_to [:admin, :ticket_priorities], notice: "Ticket Priority Updated"
      else
        render :edit
      end
    end
  
    def destroy
      @ticket_priority = TicketPriority.find params[:id]
      @ticket_priority.destroy
      redirect_to [:admin, :ticket_priorities], notice: 'Ticket Priority deleted!'
    end
  
    private
    def ticket_priority_params
      params.require(:ticket_priority).permit(
        :code,
        :description,
        :business_days,
        :business_hours
      )
    end
  end
end
