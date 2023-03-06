class CreateAffirmations < ActiveRecord::Migration[7.0]
  def change
    create_table :affirmations do |t|
      t.string :message

      t.timestamps
    end
  end
end
