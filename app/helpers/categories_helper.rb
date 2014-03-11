module CategoriesHelper
  def nested_categories(categories)
    categories.map do |category|
      render(category) + content_tag(:div, nested_categories(category.subcategories), class: "nested" )
    end.join.html_safe
  end
end
