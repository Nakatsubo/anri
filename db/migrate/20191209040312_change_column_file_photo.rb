class ChangeColumnFilePhoto < ActiveRecord::Migration[5.2]
  def up
    change_column :photos, :file, :text, null: true
  end

  def down
    change_column :photos, :file, :text, null: false
  end
end
