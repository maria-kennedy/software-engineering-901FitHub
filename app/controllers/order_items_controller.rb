class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])
    product_name = product.name
    product_price = product.price

    #try to find a user's cart
    order = current_user.orders.find_by(status: :cart)

    # if we cant find one lets make one
    unless order
      order = current_user.orders.create!(status: :cart)
    end

    if order.order_items.exists?(product_id: product.id)
      flash[:error] = "#{product.name} is already in your cart."
    else
      # Add the product to the cart
      order_item = order.order_items.build(
      product: product,
      product_name: product_name,
      product_price: product.price)
      if order_item.save
        flash[:success] = "#{product.name} has been added to your cart."
      else
        flash[:error] = "Failed to add #{product.name} to your cart."
      end
    end

    redirect_to products_path
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    #get the name of the product before we destroy for display
    product_name = @order_item.product.name
    @order_item.destroy
    flash[:success] = "Removed #{product_name} from your cart!"
    redirect_to order_url
  end

end
