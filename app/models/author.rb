class Author < ApplicationRecord
  has_many :quotes
  validates_uniqueness_of :name
end
