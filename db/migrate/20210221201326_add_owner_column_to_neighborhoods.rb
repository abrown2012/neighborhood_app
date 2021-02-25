class AddOwnerColumnToNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    add_column :neighborhoods, :owner_id, :integer
  end
end
