class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    binding.pry
    @category = Category.new(category_params)
    if Category.exists?(title: params[:title])
      render :new
      flash[:alert] = "Category already exists"
    elsif @category.save
      flash[:success] = "You have successfully created a category"
      redirect category_path(@category)
    else
      render :new
      flash[:alert] = "Error! Category not created."
    end
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end

end
