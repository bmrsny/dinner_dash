module Admin
  class ItemsController < AdminController
    def index
      @items = Item.all
    end

    def new
      @item = Item.new
      @categories = Category.all
    end

    def create
      if params[:category_list] == nil
        flash[:errors] = "You must select at least one category when creating a new item! Duh!"
        redirect_to new_admin_item_path
      else
        update_category_tag
        item = Item.create(item_params)
        item.categories = @found_tags
        redirect_to admin_items_path
      end
    end

    def edit
      @item = Item.find(params[:id])
      @categories = Category.all
    end

    def update
      if params[:category_list] == nil
        flash[:errors] = "Please reassign your item to at least one category "
        redirect_to new_admin_item_path
      else
        update_category_tag
        @item = Item.find(params[:id])
        @item.update(item_params)
        @item.categories = @found_tags
        redirect_to admin_items_path
      end
    end

    def update_category_tag
      string_category_tags = params[:category_list][:categories].uniq
      @found_tags = string_category_tags.map do |name|
        Category.find_or_create_by(name: name)
      end
    end
  end
end
