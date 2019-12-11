class RemoveColumnTextTweet < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :text, :text
  end
end
