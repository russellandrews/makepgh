class Topic < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
  	validates :title, presence: true,
                    length: { minimum: 5 }
    mount_uploader :avatar, AvatarUploader

    def self.search(query)
		# where(:title, query) -> This would return an exact match of the query
		where("title like ?", "%#{query}%")  
	end

	def newest_comments
	    self.comments.order("created_at DESC")
	  end 
end
