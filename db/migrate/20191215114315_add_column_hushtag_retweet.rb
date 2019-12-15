class AddColumnHushtagRetweet < ActiveRecord::Migration[5.2]
  def change
    add_column :retweets, :hushtag, :text
  end
end
