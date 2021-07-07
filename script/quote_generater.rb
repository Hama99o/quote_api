# all_quotes = AllQuotes.new
all_quotes.map do |quote|
  author = Author.find_by(name: quote[:quoteAuthor])

  unless author
    author = Author.create(name: quote[:quoteAuthor])
  end

  Quote.create(quote_text: quote[:quoteText], quote_genre: quote[:quoteGenre], author: author)
end
