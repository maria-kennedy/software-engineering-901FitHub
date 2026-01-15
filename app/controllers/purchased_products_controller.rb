class PurchasedProductsController < ApplicationController
  def show
    @product = Product.find(params[:product_id])
    @reviews = @product.purchased_products.where.not(review_rating: 0)
    @average_rating = @reviews.average(:review_rating)&.round(2)
  end

  def new
    @product = Product.find(params[:product_id])
    @purchased_product = current_user.purchased_products.find_by(product: @product)
  end

  def create
    @product = Product.find(params[:product_id])
    @purchased_product = current_user.purchased_products.find_by(product: @product)

    if @purchased_product.update(
         params.require(:purchased_product).permit(:review_title, :review_rating, :review_recommendation, :review_description)
       )
      flash[:success] = "Thank you for your review!"
      redirect_to product_path(@purchased_product.product)
    else
      render :new, status: :unprocessable_entity
    end
  end


end
