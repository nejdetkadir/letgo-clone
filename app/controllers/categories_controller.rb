class CategoriesController < ApplicationController
  def show
    @category = Category.active.friendly.find(params[:slug])
    @products = user_signed_in? ? @category.products.selling.where.not(user: current_user).page(params[:page]) : @category.products.selling.page(params[:page])
  end
end
