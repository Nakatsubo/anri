class AddColumnTextTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :text, :text
  end
end
