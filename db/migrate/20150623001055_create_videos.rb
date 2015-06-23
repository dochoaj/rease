class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.string :title
    	t.string :url
    	t.integer :public
    end
  end
end
