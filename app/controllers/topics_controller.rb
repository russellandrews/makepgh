class TopicsController < ApplicationController

	def new
		@topic = Topic.new
	end

	def index
		@topics = Topic.all

		if params[:search]
	      @topics = Topic.search(params[:search]).order("created_at DESC")
	      @searchActive = true;
	    else
	      @topics = Topic.order("created_at DESC")
	      @searchActive = false;
	    end
	end

	def edit
	  	@topic = Topic.find(params[:id])
	end

	def show
		@topic = Topic.find(params[:id])
	end

	def create
		@topic = Topic.new(topic_params)

		@topic.user = current_user
		
		if @topic.save
		    redirect_to @topic
	  	else
		    render 'new'
		end
	end

	def update
	  @topic = Topic.find(params[:id])
	 
	  if @topic.update(topic_params)
	    redirect_to @topic
	  else
	    render 'edit'
	  end
	end

	def upload
		t = Topic.new
		t.avatar = params[:file]
		t.avatar = File.open('somewhere')
		t.save!
		t.avatar.url # => '/url/to/file.png'
		t.avatar.current_path # => 'path/to/file.png'
		t.avatar.identifier 
	end

	def destroy
		@topic = Topic.find(params[:id])
	  	@topic.destroy
	 
	  	redirect_to topics_path
	end

	private
		def topic_params
			params.require(:topic).permit(:title, :body, :avatar, :user_id)
		end

end
