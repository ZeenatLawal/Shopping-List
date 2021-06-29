class AnyMigration < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :items, :groups
  end
end
