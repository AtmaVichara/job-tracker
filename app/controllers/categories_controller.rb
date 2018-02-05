class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    binding.pry
    @category = Category.new
  end

  def create
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
