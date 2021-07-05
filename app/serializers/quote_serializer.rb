class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :quote_text, :quote_author, :author_id
  # belongs_to :author
  def quote_author
    Author.find(object.author_id).name
  end
end
