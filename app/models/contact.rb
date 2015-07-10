class Contact < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true, length: {minimum: 20, maximum: 10000} 
	validates :body, presence: true
end
