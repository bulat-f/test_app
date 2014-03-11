class CategoriesController < ApplicationController
  def index
    @roots = Array.new
    @roots.push Category.find_by(parent_id: nil)
  end

  def show
    @category = Category.find_by(id: params[:id])
    @posts = @category.posts
  end
end
