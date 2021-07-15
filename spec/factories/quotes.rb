FactoryBot.define do
  factory :quote do

    sequence :quote_text do |n|
      "A real Christian is a person who can give his pet parrot to the town gossip.#{n}"
    end
    quote_genre { "pet" }
    author
  end
end
