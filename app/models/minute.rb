class Minute < ActiveRecord::Base

	has_attached_file :archive
	validates_attachment_content_type :archive, :content_type => ['application/pdf', 'application/msword', 'text/plain']
end
