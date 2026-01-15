# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authorize_admin, only: %i[edit update]
  def home
    render :home
  end

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def show
    @product = Product.find(params[:id])
    @user_purchased = if current_user
                        current_user.purchased_products.exists?(product: @product)
                      else
                        false
                      end
    render :show
  end

  def leave_review
    @product = Product.find(params[:id])

    if user_signed_in?
      if current_user.purchased_products.exists?(product: @product)
        redirect_to new_purchased_product_path(@product)
      else
        flash[:error] = 'You need to purchase this product before leaving a review.'
        redirect_to product_path(@product)
      end
    else
      flash[:error] = 'You must be signed in to leave a review.'
      redirect_to new_user_session_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    # Dynamically determine the subclass and adjust strong parameters
    permitted_params = params.require(@product.class.name.underscore.to_sym).permit(
      :name,
      :price,
      :description,
      :diet_type,
      :dietary_restrictions,
      :experience_level,
      :muscle_group,
      :file,
      :picture
    )

    if @product.update(permitted_params)
      redirect_to product_path(@product), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  private

  def authorize_admin
    return if current_user&.admin?

    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end
end
