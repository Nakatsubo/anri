class ReChangeColumnEndemicTweet < ActiveRecord::Migration[5.2]
  def up
    change_column :tweets, :endemic, :bigint, null: false
  end

  def down
    change_column :tweets, :endemic, :integer, null: true
  end
end
