class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :yrsExp
      t.integer :desiredYrsExp

      t.timestamps
    end
  end
end
