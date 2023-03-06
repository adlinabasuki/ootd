class CreateItemsOccasions < ActiveRecord::Migration[7.0]
  def change
    create_table :items_occasions do |t|
      t.references :item, null: false, foreign_key: true
      t.references :occasion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
