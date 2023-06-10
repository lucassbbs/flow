class AddStepIdToTask < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :step, :string
    add_reference :tasks, :step, foreign_key: true
  end
end
