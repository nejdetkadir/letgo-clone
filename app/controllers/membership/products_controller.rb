class Membership::ProductsController < MembershipController
  def create
    # byebug
    @product = current_user.products.new(product_params)
    render json: @product.save ? {slug: @product.slug, id: @product.id} : @product.errors 
  end

  private
  
  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, {images: []})
  end
end