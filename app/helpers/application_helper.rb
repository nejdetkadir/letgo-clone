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

  def not_current_user(model)
    if user_signed_in?
      if current_user.id == model.user.id
        false
      else
        true
      end
    else
      true
    end
  end
end
