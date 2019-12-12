class ReChangeColumnOtherOptionsUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :screen_name, :string
  end
end
