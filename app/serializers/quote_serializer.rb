class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :quote_text, :quote_author, :quote_genre, :author_id
  # belongs_to :author
  def quote_author
    object.author.name
  end
end
