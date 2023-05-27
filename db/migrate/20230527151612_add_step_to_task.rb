class AddStepToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :step, :string
  end
end
