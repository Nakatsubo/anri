class ChangeColumnStatusReply < ActiveRecord::Migration[5.2]
  def up
    add_column :replies, :status, :bigint
  end

  def down
    remove_column :replies, :endemic, :integer
  end
end
