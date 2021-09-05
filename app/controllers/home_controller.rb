# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if user_signed_in?
      @products = Product.selling.where.not(user: current_user).page(params[:page])
    else
      @products = Product.selling.page(params[:page])
    end
  end
end