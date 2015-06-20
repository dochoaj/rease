class Area < ActiveRecord::Base
	
	has_many :requests
	has_many :service_offerings

end