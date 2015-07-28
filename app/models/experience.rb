class Experience < ActiveRecord::Base
	belongs_to :user
	belongs_to :request
	belongs_to :offering
	belongs_to :institution
end