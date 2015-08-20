class Area < ActiveRecord::Base
	
	has_many :requests
	has_many :offerings
	has_many :services
	has_many :experiences

end