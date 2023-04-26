class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.string :qualification
      t.string :university
      t.date :date_completed
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
