class CreateNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhoods do |t|
      t.string :neighborhood_name
      t.string :city
      t.string :state
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
