class User < ActiveRecord::Base

	acts_as_authentic

	has_many :topics
	has_many :items
	mount_uploader :avatar, AvatarUploader

	def to_param
	    username
	end

	def self.search(query)
		# where(:title, query) -> This would return an exact match of the query
		where("description like ?", "%#{query}%")  
	end

end
