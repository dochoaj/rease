class Comment < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :request
	belongs_to :service_offerings

end