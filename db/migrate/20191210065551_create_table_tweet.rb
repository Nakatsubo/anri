class CreateTableTweet < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.integer :endemic, null: false
      t.references :user, foreign_key: true
      t.references :photo, foreign_key: true

      t.timestamps
    end
  end
end
