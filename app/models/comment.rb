class Comment < ActiveRecord::Base
  belongs_to :topic

 	scope :newest_first, order("created_at DESC")

end
