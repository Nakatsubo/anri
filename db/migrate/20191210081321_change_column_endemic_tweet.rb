class ChangeColumnEndemicTweet < ActiveRecord::Migration[5.2]
  def up
    change_column :tweets, :endemic, :integer, null: true
  end

  def down
    change_column :tweets, :endemic, :integer, null: false
  end
end
