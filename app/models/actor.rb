class Actor < ApplicationRecord
    belongs_to :country
    has_many :movie_actors
    has_many :movies, through: :movie_actors
    validates_presence_of :name, :gender, :age
end