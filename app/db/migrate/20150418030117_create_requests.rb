class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.references :user
      t.references :experience
  	  t.references :community
	  t.references :area

      t.timestamps
    end
  end
end
