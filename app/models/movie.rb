class Movie < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 20 }
  validates :description, presence: true, length: { in: 10..200, wrong_length:"Wrong number of characters!" }
end