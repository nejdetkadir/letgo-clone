# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @categories_data = Category.active
  end
end