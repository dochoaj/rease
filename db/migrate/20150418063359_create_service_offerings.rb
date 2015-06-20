class CreateServiceOfferings < ActiveRecord::Migration
  def change
    create_table :service_offerings do |t|
    	t.string :titlle
    	t.text :description
    	t.date :date
		  t.references :user
      t.references :experience
      t.references :area    
      t.references :community
    	t.timestamps
    end
  end
end