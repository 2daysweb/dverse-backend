class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :bio
      t.string :education
      t.string :education_type
      t.boolean :can_invite
      t.string :resume
      t.string :user_type

      t.timestamps
    end
  end
end
