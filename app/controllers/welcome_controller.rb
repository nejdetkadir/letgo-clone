class WelcomeController < ApplicationController
  def index
    @categories_data = Category.active
  end
end
