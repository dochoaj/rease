class CreateServiceOfferings < ActiveRecord::Migration
  def change
    create_table :service_offerings do |t|
    	t.string :titlle
    	t.text :description
    	t.date :date
    	t.timestamps
    end
  end
end
