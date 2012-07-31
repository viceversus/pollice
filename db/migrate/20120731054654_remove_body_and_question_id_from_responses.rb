class RemoveBodyAndQuestionIdFromResponses < ActiveRecord::Migration
  def up
    remove_column :responses, :body
    remove_column :responses, :question_id
  end

  def down
  end
end
