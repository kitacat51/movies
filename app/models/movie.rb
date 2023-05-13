class Movie < ApplicationRecord
    has_many :movie_genres, dependent: :destroy
    has_many :genres, through: :movie_genres
    belongs_to :review
end
