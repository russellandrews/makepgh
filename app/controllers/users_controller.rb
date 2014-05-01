class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		@user.neighborhood = current_user

		respond_to do |format|
	      if @user.save
	        format.html { redirect_to(:users, :notice => 'Registration successfull!') }
	        format.xml  { render :xml => @user, :status => :created, :location => @user }
	      else
	        format.html { render :action => "new" }
	        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
	      end
	    end
	end

	def show
		@user = User.find_by_username(params[:id])
	end

	def update
	  @user = User.find_by_username(params[:id])
	 
	  if @user.update(user_params)
	    redirect_to @user
	  else
	    render 'edit'
	  end
	end

	def index
		@users = User.all

		if params[:search]
	      @users = User.search(params[:search]).order("created_at DESC")
	      @searchActive = true;
	    else
	      @users = User.order("created_at DESC")
	      @searchActive = false;
	    end

	    if (params[:neighborhood] && User.all.collect(&:neighborhood).include?(params[:neighborhood]))
			@users = User.send(params[:neighborhood].downcase)
		else
			@users = User.all
		end
	end

	def edit
	  @user = User.find_by_username(params[:id])
	end

	def destroy
	  @user = User.find_by_username(params[:id])
	  @user.destroy
	 
	  redirect_to users_path
	end

	private
	  def user_params
	    params.require(:user).permit(:user_id, :username, :email, :avatar, :neighborhood, :password, :password_confirmation, :cause, :cause_percent, :first_name, :last_name, :description, :phone_number, :user_id, :topic, :item)
	  end
end
