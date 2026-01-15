# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def checkout
    @order = current_user.orders.find_by(status: :cart)

    if @order.order_items.empty?
      flash[:error] = 'Must have items in your cart before purchasing'
      redirect_to products_path
    else
      @payment = current_user.payment
      render :checkout
    end
  end

  def edit
    @payment = current_user.payment
    render :edit_payment
  end

  def update
    @payment = current_user.payment
    if @payment.update(params.require(:payment).permit(:name, :card_number, :expiration_month, :expiration_year,
                                                       :security_code))
      flash[:success] = 'Your information was successfully updated!'
      redirect_to user_account_path
    else
      flash.now[:error] = @payment.errors.objects.first.full_message
      render :edit_payment
    end
  end

  def complete_order
    @payment = current_user.payment
    if @payment.update(params.require(:payment).permit(:name, :card_number, :expiration_month, :expiration_year,
                                                       :security_code))
      @order = current_user.orders.find_by(status: :cart)
      @order.update(status: :completed)
      @order.order_items.each do |order_item|
        product = order_item.product
        unless current_user.purchased_products.exists?(product: product)
          reviewable_product = current_user.purchased_products.create!(
            product: product,
            review_title: "Pending Review",
            review_rating: 0,
            review_recommendation: nil,
            review_description: nil
          )
        end
      end

      current_user.orders.create!(status: :cart)
      flash[:success] = 'Your purchase was successful!'

      redirect_to confirmation_path(confirmation_num: @order.confirmation_number)

    else
      flash.now[:error] = @payment.errors.objects.first.full_message
      render :checkout
    end
  end
end
