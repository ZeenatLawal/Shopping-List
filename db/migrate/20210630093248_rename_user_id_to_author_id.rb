class RenameUserIdToAuthorId < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :user_id, :author_id
  end
end
