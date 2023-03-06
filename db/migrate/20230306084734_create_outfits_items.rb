class CreateOutfitsItems < ActiveRecord::Migration[7.0]
  def change
    create_table :outfits_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :outfit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
