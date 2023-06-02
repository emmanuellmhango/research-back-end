class AddVoiceTextToSaveExpressions < ActiveRecord::Migration[7.0]
  def change
    add_column :save_expressions, :voice_text, :string
  end
end
