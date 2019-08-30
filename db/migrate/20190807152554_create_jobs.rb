class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :status
      t.string :body
      t.string :title
      t.string :industry
      t.string :job_type

      t.timestamps
    end
  end
end
