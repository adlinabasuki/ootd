class AddStatusToOutfits < ActiveRecord::Migration[7.0]
  def change
    add_column :outfits, :status, :string, default: "rejected"
  end
end
