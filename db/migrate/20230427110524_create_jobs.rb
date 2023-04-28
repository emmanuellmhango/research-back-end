class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :position
      t.string :description
      t.string :required_education
      t.string :needed_skills
      t.date :closing_date
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
