class ItemsController < ApplicationController
	def create
	    @user = User.find_by_username(params[:user_id])
	    @item = @user.items.create(item_params)

	    redirect_to user_path(@user)
  	end

  	def destroy
	    @user = User.find_by_username(params[:user_id])
	    @item = @user.items.find(params[:id])
	    @item.destroy
	    redirect_to user_path(@user)
  	end
	 
  	private
	    def item_params
	      	params.require(:item).permit(:title, :description, :avatar)
		end
end
