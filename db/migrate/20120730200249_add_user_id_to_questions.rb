class AddUserIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :poll_id, :integer
  end
end
