class TicketsController < ApplicationController
  #require authorization
  before_filter :authorize

  def index
    @tickets = Ticket.all.order(created_at: :desc)
  end

  def new
    @ticket = Ticket.new
    @ticket_priorities = TicketPriority.all
    @ticket_types = TicketType.all
    @ticket_status_codes = TicketStatusCode.all

  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to [:admin, :tickets], notice: 'Ticket created!'
    else
      render :new
    end
  end

  def show
    @ticket = Ticket.find params[:id]
  end

  private
  def ticket_params
    params.require(:ticket).permit(
      :user_id,
      :technician_id,
      :contract_product_id,
      :ticket_priority_id,
      :ticket_status_code_id,
      :ticket_type_id,
      :problem_description,
      :solution_description,
      assigned_at,
      closed_at,
      to_be_solved_at
    )
  end
end
