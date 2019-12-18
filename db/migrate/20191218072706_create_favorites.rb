class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.bigint :status
      t.references :tweet, foreign_key: true

      t.timestamps
    end
  end
end
