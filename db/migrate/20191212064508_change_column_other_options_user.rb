class ChangeColumnOtherOptionsUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :twitter, :text
  end

  def down
    remove_column :users, :screen_name, :string
  end
end
