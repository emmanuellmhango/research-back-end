class CreateSaveQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :save_questions do |t|
      t.string :question
      t.string :answer
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
