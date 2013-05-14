class CreateIdeas < ActiveRecord::Migration
  def up
    create_table :ideas do |t|
      t.integer :user_id, null: false
      t.string :text, null: false
    end
  end

  def down
    drop_table :ideas
  end
end
