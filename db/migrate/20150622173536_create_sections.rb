class CreateSections < ActiveRecord::Migration
	def change
		create_table :sections do |t|
			t.string :title
			t.string :order
			t.text :body
			t.timestamps
		end
	end
end
