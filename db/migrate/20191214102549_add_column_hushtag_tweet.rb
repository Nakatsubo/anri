class AddColumnHushtagTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :hushtag, :text
  end
end
