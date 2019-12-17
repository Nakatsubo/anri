class ChangeColumnEndemicReply < ActiveRecord::Migration[5.2]
  def up
    change_column :replies, :endemic, :integer
  end

  def down
    remove_column :replies, :endemic, :endemic
  end
end
