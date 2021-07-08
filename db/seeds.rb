# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require './script/all_quotes'

all_quotes = AllQuotes.new.quote_array

all_quotes.map do |quote|
  author = Author.find_by(name: quote[:quoteAuthor])

  unless author
    author = Author.create(name: quote[:quoteAuthor])
  end

  Quote.create(quote_text: quote[:quoteText], quote_genre: quote[:quoteGenre], author: author)
end
