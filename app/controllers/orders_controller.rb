# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = current_user.orders.where(status: :completed)
    render :index
  end

  def show
    # find the active cart first
    @order = current_user.orders.find_by(status: :cart)
    @total_price = 0
    @order.order_items.each do |order_item|
      @total_price += order_item.product_price
    end
    render :show
  end

  def confirmation
    @order = current_user.orders.find_by(confirmation_number: params[:confirmation_num])

    if @order
      if @order.completed?
        @total_price = 0
        @order.order_items.each do |order_item|
          @total_price += order_item.product_price
        end
        render :confirmation
      else
        flash[:error] = 'This order has not been completed.'
        redirect_to root_path
      end
    else
      flash[:error] = 'Order not found.'
      redirect_to root_path
    end
  end
end

class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.where(status: :completed)
    render :index
  end
end
