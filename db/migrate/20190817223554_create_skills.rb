class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :yrs_exp
      t.integer :desired_yrs_exp

      t.timestamps
    end
  end
end
