class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @listing = @category.items.all
  end
  helper_method :show

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render "admin/categories/new"
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render "admin/categories/edit"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
