class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :show, :update, :destroy]

  def show
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You have successfully created a category"
      redirect_to category_path(@category)
    else
      render :new
      flash[:alert] = "Error! Category not created."
    end
  end

  def edit
  end

  def update
    @category.update!(category_params)
    flash[:success] = "You have successfully updated the category."
    redirect_to categories_path
  end

  def destroy
    @category.destroy
    flash[:success] = "You have successfully deleted the category."
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
