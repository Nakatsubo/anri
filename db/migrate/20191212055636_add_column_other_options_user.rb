class AddColumnOtherOptionsUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :description, :text
    add_column :users, :screen_name, :string
    add_column :users, :website, :text
  end
end
