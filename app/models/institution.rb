class Institution < ActiveRecord::Base
	has_many :users

	has_attached_file :logo, styles: {mini:"200x100"}
	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/ 

end
