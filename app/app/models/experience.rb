class Experience < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :request
	belongs_to :service_offering

	has_many :requests
	has_many :service_offering

end