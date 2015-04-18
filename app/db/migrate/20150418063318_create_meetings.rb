class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
    	t.string :title
    	t.text :description
    	t.text :adress
    	t.timestamps
    end
  end
end
