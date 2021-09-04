# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if user_signed_in?
      @products = Product.selling.where.not(user: current_user).limit(40)
    else
      @products = Product.selling.limit(40)
    end
  end
end