class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.date :deadline
      t.boolean :archived
      t.references :client

      t.timestamps
    end
  end
end
