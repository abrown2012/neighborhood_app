class Neighborhood < ActiveRecord::Base
    has_many :posts 
    has_many :users
    validates :state, presence: true,  length: {in: 2..30}
    validates :neighborhood_name, presence: true, length: {in: 3..30}
    validates :city, presence: true, length: {in: 3..50}
end