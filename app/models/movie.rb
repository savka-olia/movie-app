class Movie < ApplicationRecord
  has_one_attached :image, :dependent => :destroy
  validates :title, presence: true, length: { minimum: 3, maximum: 20 }
  validates :description, presence: true, length: { in: 10..400, wrong_length:"Wrong number of characters!" }
end