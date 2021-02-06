class CreateUserneighborhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :userneighborhoods do |t|
      t.references :user_id 
      t.references :neighborhood_id 
      t.timestamps null: false 
    end 
  end
end
