class InterestLink < ActiveRecord::Base
	def self.search(search)
		where("name LIKE ? or description LIKE ?", "%#{search}%","%#{search}%") 
	end
end
