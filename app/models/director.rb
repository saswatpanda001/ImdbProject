class Director < ApplicationRecord
    has_many :movie_directors, dependent: :destroy
    has_many :movies, through: :movie_directors
  
    validates :name, presence: true
  end
  