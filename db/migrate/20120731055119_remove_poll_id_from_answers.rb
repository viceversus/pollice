class RemovePollIdFromAnswers < ActiveRecord::Migration
  def up
    remove_column :answers, :poll_id
    add_column    :answers, :question_id, :integer
  end

  def down
  end
end
