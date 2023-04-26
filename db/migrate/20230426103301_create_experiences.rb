class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :position
      t.string :company
      t.date :date_joined
      t.date :date_left
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
