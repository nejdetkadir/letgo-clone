class ProductsController < ApplicationController
  def show
    @product = Product.selling.friendly.find(params[:slug])
  end
end
