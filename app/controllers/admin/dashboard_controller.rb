class Admin::DashboardController < ApplicationController
    def show
      @product_count = Product.count
      @category_count = Category.count
      @ticket_count = Ticket.count
      
      @ticket_closed_count = Ticket.select(:closed_at).count
      @ticket_closed_count = Ticket.select(:closed_at).count
      @ticket_closed_count = Ticket.select(:closed_at).count
      @assigned_tickets = StatTechnician.select(:assigned).count
      @tickets_today = StatTicket.where(this_date: [Time.now.at_beginning_of_day, Time.now.end_of_day]).count
     
      @t_all = StatTechnician.all.to_a
      @t_all_ticket = StatTicket.all.to_a
      # @ticket_solved_lastweek = Ticket.group()
     
      @tickets_due_today = Ticket.where(to_be_solved_at: [Time.now.at_beginning_of_day, Time.now.end_of_day]).count
      @category_new_count = Category.group(:code).count
      @ticket_new_count = Ticket.group(:technician_id).count
      @tech_count = StatTechnician.count
      @tech_count_assigned = StatTechnician.group(:assigned).count
      @tech_count_assigned = StatTechnician.group(:name).count
      @tech_count_done = StatTechnician.group(:solved).count
      @tech_low_priority = StatTicket.where(code: ["Low"]).count
      @tech_medium_priority = StatTicket.where(code: ["Medium"]).count
      @tech_high_priority = StatTicket.where(code: ["High"]).count
      @tech_low = Ticket.where(ticket_priority_id: ["Low"]).count
      @tech_medium = Ticket.where(ticket_priority_id: ["Medium"]).count
      @tech_high = Ticket.where(ticket_priority_id: ["High"]).count

      
      # @technecian_count = Technecian.group(:all_tickets).count
      # @technecian_overdo = Technecian.group(:tickets_overdo).count
      
      
    end
    
  end