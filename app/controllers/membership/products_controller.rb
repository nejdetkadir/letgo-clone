class Membership::ProductsController < MembershipController
  def create
    # byebug
    @product = current_user.products.new(product_params)
    render json: @product.save ? {slug: @product.slug, id: @product.id} : @product.errors 
  end

  def status
    @product = current_user.products.selling.find(params[:id])
    unless @product
      render json: {error: "Bir hata meydana geldi."}
    end
    @product.update(status: Product.statuses[status_params[:status].to_sym])
    render json: {status: @product.status}
  end

  private
  
  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, {images: []}, :quarter_id)
  end

  def status_params
    params.require(:product).permit(:status)
  end
end