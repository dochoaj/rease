class Comment < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :post, polymorphic: true

	validates :body, presence: true, length: {minimum: 10, maximum: 150}

end