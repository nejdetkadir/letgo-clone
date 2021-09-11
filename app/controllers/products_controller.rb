class ProductsController < ApplicationController
  before_action :set_product
  before_action :authenticate_user!, only: [:favorite]

  include ApplicationHelper

  def show
    @like_products = @product.category.products.selling.limit(20)
  end

  def favorite
    if liked_it(@product)
      @product.favorites.where(user: current_user).delete_all
      render json: {status: 'unfavorited'}
    else
      @product.favorites.create(user: current_user)
      render json: {status: 'favorited'}
    end
  end

  private

  def set_product
    @product = Product.selling.friendly.find(params[:slug])
  end
end
