class ServiceOffering < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :experience
	belongs_to :area		
	belongs_to :community
	
	has_many :comments

	has_one :experience

end