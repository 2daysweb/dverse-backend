class CreateUserJobPostings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_job_postings do |t|
      t.integer :user_id
      t.integer :job_posting_id

      t.timestamps
    end
  end
end
