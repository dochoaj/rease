class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :title
    	t.text :description
    	t.text :adress
    	t.timestamps
    end
  end
end
