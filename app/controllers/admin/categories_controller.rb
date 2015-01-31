module Admin
  class CategoriesController < AdminController
    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def edit
      @category = Category.find(params[:id])
    end

    def destroy
      category = Category.find(params[:id])
      category.destroy
      redirect_to admin_categories_path
    end
  end
end
