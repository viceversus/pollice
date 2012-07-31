class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :responder
      t.text :body
      t.integer :question_id
      t.integer :poll_id

      t.timestamps
    end
  end
end
