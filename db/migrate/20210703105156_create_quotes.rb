class CreateQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :quotes do |t|
      t.text :quote_text, unique: true
      t.text :quote_genre
      t.string :author

      t.timestamps
    end
  end
end
