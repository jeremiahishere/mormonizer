class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :user_id
      t.integer :language_id
      t.text :input_text
      t.text :output_text

      t.timestamps
    end
  end
end
