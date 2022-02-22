class Movie < ApplicationRecord
  has_many :movie_actors
  belongs_to :studio

  has_many :actors, through: :movie_actors
end
