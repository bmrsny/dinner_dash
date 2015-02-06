module Admin
  class AdminController < ApplicationController
    before_action :verify_admin
    def show
    end

    private
    def verify_admin
      unless current_user && current_user.role == "admin"
        flash[:errors] = "Not authorized"
        redirect_to root_url
      end
    end

    def item_params
      params.require(:item).permit(:title,
                                   :description,
                                   :price,
                                   :image,
                                   :retired)
    end
  end
end
