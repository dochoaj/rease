class AddCategoryToUser < ActiveRecord::Migration
	def change
		add_column :users, :category, :integer
		remove_column :users, :category_id
	end
end