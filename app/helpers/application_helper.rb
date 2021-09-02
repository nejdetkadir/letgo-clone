module ApplicationHelper
  def active_categories
    Category.active
  end
end
