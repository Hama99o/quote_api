class AddAuthorToQuotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :quotes, :author, null: false, foreign_key: true
  end
end
