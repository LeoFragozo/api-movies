class Country < ApplicationRecord
    has_many :actors 
    has_many :movies
end