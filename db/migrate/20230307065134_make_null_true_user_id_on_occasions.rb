class MakeNullTrueUserIdOnOccasions < ActiveRecord::Migration[7.0]
  def change
    change_column_null :occasions, :user_id, true
  end
end
