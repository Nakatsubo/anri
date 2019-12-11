class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :label1
      t.string :label2
      t.string :label3
      t.string :label4
      t.string :label5
      t.references :photo, foreign_key: true

      t.timestamps
    end
  end
end
