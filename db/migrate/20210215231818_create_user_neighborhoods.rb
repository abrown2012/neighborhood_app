class CreateUserNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :user_neighborhoods do |t|
      t.integer :neighborhood_id
      t.integer :user_id 
      t.timestamps
    end
  end
end
