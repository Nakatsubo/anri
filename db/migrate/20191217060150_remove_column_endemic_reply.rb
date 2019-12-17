class RemoveColumnEndemicReply < ActiveRecord::Migration[5.2]
  def change
    remove_column :replies, :endemic, :integer
  end
end
