class Resource < ActiveRecord::Base

	has_attached_file :archive
	validates_attachment_content_type :archive, :content_type => ['application/pdf', 'application/msword', 'text/plain']

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :category, presence: true
	def self.search(search)
		where("name LIKE ? or category LIKE ? or description LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
	end
end
