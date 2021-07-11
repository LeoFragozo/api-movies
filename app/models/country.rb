class Country < ApplicationRecord
    has_many :actors 
    has_many :movies
    validates_presence_of :name
end