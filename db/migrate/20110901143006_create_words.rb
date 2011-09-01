class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :language_id
      t.string :match_word
      t.string :replacement_word

      t.timestamps
    end
  end
end
