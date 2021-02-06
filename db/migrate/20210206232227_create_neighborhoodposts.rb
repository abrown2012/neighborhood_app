class CreateNeighborhoodposts < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhoodposts do |t|
      t.references :post_id 
      t.references :neighborhood_id 
      t.timestamps null: false
    end 
  end
end
