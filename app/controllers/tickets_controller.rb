class TicketsController < ApplicationController
  #require authorization
  before_filter :authorize

  def index
    @userType = loggedAs
    if @userType == 'Admin'
      @tickets = Ticket.all.order(created_at: :desc)
    end
    if @userType == 'Technician'
      @tickets = Ticket.find_by_technician_id(current_user.id)
    end
    if @userType == 'User'
      @tickets = Ticket.find_by_user_id(current_user.id)
    end
  end

  def new
    @ticket = Ticket.new
    @ticket_priorities = TicketPriority.all
    @ticket_types = TicketType.all
    @ticket_status_codes = TicketStatusCode.all

    @type = UserType.find_by_code('Technician')
    @technicians = @type.users

    # @contracts = Contract.find_by_user_id(current_user.id)
    # @contracts && @contract_products = @contracts.contract_products 
    # @products = @contract_products.products
    @categories = Category.all
    @products = Product.all
    @default_products = @products.select{|p| p.category_id == @categories.first.id}

    @userType = loggedAs
  end

  def create
    @ticket = Ticket.new(ticket_params)

    @ticket.user_id = current_user.id
    @ticket.reference = get_random_string(6)
    @ticket.ticket_status_code_id = TicketStatusCode.find_by_code('Opened').id
    @ticket.ticket_priority_id = TicketPriority.find_by_code('Low').id
    @ticket.ticket_type_id = TicketType.find_by_code('Website').id

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

    # @contracts = Contract.find_by_user_id(current_user.id)
    # @contracts && @contract_products = @contracts.contract_products
    @categories = Category.all
    @products = Product.all
    @default_products = @products.select{|p| p.category_id == @ticket.category_id}

    @userType = loggedAs

    @user_created_by = User.find_by_id(@ticket.user_id)
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

  def loggedAs
    UserType.find_by_id(current_user.user_type_id).code
  end

  def get_random_string(length=5)
    source=("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a + ["_","-","."]
    key=""
    length.times{ key += source[rand(source.size)].to_s }
    return key
  end
end
