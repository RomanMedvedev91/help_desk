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

    @type = UserType.find_by_code('Technician')
    @technicians = @type.users

    @contracts = Contract.find_by_user_id(27)  #(current_user.id)
    @contract_products = @contracts.contract_products 
    # @products = @contract_products.products
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to [:tickets], notice: 'Ticket created!'
    else
      render :new
    end
  end

  def show
    @ticket = Ticket.find params[:id]
  end

  def edit
    @ticket = Ticket.find params[:id]
    @ticket_priorities = TicketPriority.all
    @ticket_types = TicketType.all
    @ticket_status_codes = TicketStatusCode.all

    @type = UserType.find_by_code('Technician')
    @technicians = @type.users

    @contracts = Contract.find_by_user_id(27)  #(current_user.id)
    @contract_products = @contracts.contract_products 

  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      redirect_to [:tickets], notice: "Ticket Updated"
    else
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.find params[:id]
    @ticket.destroy
    redirect_to [:tickets], notice: 'Ticket deleted!'
  end

  private
  def ticket_params
    params.require(:ticket).permit(
      :user_id,
      :reference,
      :technician_id,
      :contract_product_id,
      :ticket_priority_id,
      :ticket_status_code_id,
      :ticket_type_id,
      :problem_description,
      :solution_description,
      :assigned_at,
      :closed_at,
      :to_be_solved_at
    )
  end
end
