class Comment < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :request
	belongs_to :offering
	belongs_to :event

end