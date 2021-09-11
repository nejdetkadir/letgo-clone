module ApplicationHelper
  def active_categories
    Category.active
  end

  def liked_it(product)
    if user_signed_in?
      product.favorites.exists?(user: current_user)
    else
      false
    end
  end
end
