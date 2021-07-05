class Quote < ApplicationRecord
  belongs_to :author
  validates_uniqueness_of :quote_text
end
