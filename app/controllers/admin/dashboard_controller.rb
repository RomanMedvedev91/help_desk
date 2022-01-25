class Admin::DashboardController < ApplicationController

    def show
      @tickets_opened       = Ticket.where(created_at: Time.current.all_day).count
      @tickets_not_assigned = Ticket.where(technician_id: nil).count
      @tickets_due          = Ticket.where(to_be_solved_at:  Time.current.all_day).count
      @tickets_closed       = Ticket.where(closed_at:  Time.current.all_day).count
      @tickets_overdue      = Ticket.where("to_be_solved_at < ?",Date.tomorrow).count

      @tickets = Ticket.where("to_be_solved_at <= ?",Date.tomorrow).order(:to_be_solved_at) #overdue
    end

  end
