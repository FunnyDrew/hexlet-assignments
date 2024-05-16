class AddUserAndStatusToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :user, null: false, foreign_key: true
    add_reference :tasks, :status, null: false, foreign_key: true
  end
end
