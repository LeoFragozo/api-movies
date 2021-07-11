class Movie < ApplicationRecord
    belongs_to :country
    has_many :movie_actors
    has_many :actors, through: :movie_actors
    validates_presence_of :name, :release_year
end