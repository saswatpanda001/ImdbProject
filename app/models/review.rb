class Review < ApplicationRecord
  belongs_to :movie

  validates :review_text, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
