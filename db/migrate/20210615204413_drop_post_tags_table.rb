class DropPostTagsTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :post_tags
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
