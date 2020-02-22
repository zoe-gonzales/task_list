class CreateSubTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_tasks do |t|
      t.text :text
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
