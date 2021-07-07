class RemoveAuthorFromQuote < ActiveRecord::Migration[6.1]
  def change
    remove_column :quotes, :author, :string
  end
end
