class AddForeignKeysToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :user_id, :integer
    add_column :tasks, :created_by, :integer
    add_index :tasks, :user_id
    add_index :tasks, :created_by
    add_foreign_key :tasks, :users, column: :user_id
    add_foreign_key :tasks, :users, column: :created_by
  end
end
