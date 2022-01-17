class Admin::DashboardController < ApplicationController
    def show
      @product_count = Product.count
      @category_count = Category.count
      @ticket_count = Ticket.count
      
      @ticket_closed_count = Ticket.select(:closed_at).count
# => { 'Rome' => 5, 'Paris' => 3 }
      @category_new_count = Category.group(:code).count
      
      
    end
    
  end