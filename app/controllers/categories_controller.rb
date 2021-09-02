class CategoriesController < ApplicationController
  def show
    @category = Category.active.friendly.find(params[:id])
  end
end
