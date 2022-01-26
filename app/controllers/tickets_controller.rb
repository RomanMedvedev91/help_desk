class TicketsController < ApplicationController
  #require authorization
  before_filter :authorize

  def index
    @userType = loggedAs
    sort_by = ''
    params['sort'] && sort_by = params['sort']
    
    if @userType == 'Admin'
      if sort_by == 'user_id'
        @tickets = Ticket.joins(:user).includes(:user).select("tickets.*, users.name").order("users.name").paginate(:page => params[:page], :per_page => 5)
      elsif sort_by == 'ticket_priority_id'  
        @tickets = Ticket.joins(:ticket_priority).includes(:ticket_priority).select("tickets.*, ticket_priorities.code").order("ticket_priorities.code").paginate(:page => params[:page], :per_page => 5)
      elsif sort_by == 'technician_id'
        @tickets = Ticket.all.order(technician_id: :desc).paginate(:page => params[:page], :per_page => 5)
      elsif sort_by == 'status_code_id'
        @tickets = Ticket.joins(:ticket_status_code).includes(:ticket_status_code).select("tickets.*, ticket_status_codes.code").order("ticket_status_codes.code").paginate(:page => params[:page], :per_page => 5)
      elsif sort_by == 'ticket_type_id'
        @tickets = Ticket.joins(:ticket_type).includes(:ticket_type).select("tickets.*, ticket_types.code").order("ticket_types.code").paginate(:page => params[:page], :per_page => 5)
      else
        @tickets = Ticket.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
      end
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
      :to_be_solved_at,
      :category_id,
      :product_id,
      :serial_number,
      :model
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
