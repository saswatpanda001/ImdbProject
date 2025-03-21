class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :movie_directors, dependent: :destroy
  has_many :directors, through: :movie_directors
  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors

  validates :title, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true
  validates :budget, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :revenue, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  # Optional validations if needed
  validates :overview, length: { maximum: 5000 }, allow_nil: true
end


