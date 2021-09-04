class ProductsController < ApplicationController
  before_action :set_product

  def show
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
