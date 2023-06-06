class CreateSaveExpressions < ActiveRecord::Migration[7.0]
  def change
    create_table :save_expressions do |t|
      t.string :expressions
      t.string :voice_text
      t.binary :video_feed
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.references :save_question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
