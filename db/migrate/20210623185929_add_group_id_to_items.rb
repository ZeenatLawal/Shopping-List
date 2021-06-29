class AddGroupIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :group_id, :integer
  end
end
