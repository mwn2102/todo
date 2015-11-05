class AddRowOrderToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :row_order, :integer
  end
end
