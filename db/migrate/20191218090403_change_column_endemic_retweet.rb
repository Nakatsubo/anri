class ChangeColumnEndemicRetweet < ActiveRecord::Migration[5.2]
  def change
    change_column :retweets, :endemic, :bigint
  end
end
