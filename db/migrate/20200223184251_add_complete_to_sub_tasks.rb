class AddCompleteToSubTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :sub_tasks, :complete, :boolean
  end
end
