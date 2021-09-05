class ProductsController < ApplicationController
  before_action :set_product

  def show
    @like_products = @product.category.products.selling.limit(20)
  end

  def favorite
  end

  def unfavorite
  end

  private

  def set_product
    @product = Product.selling.friendly.find(params[:slug])
  end
end
