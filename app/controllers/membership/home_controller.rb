class Membership::HomeController < MembershipController
  def index
    @sold = current_user.products.sold.page(params[:page])
    @selling = current_user.products.selling.page(params[:page])
    @favorites = current_user.favorites.page(params[:page])
  end
end
