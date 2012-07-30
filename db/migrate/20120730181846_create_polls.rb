class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :author
      t.string :title
      t.string :encrypted_url

      t.timestamps
    end
  end
end
