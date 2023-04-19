class CreateBiodata < ActiveRecord::Migration[7.0]
  def change
    create_table :biodata do |t|
      t.string :address
      t.text :education
      t.text :experience
      t.date :date_of_birth
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
