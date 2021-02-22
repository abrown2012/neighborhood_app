class Neighborhood < ActiveRecord::Base
    has_many :posts 
    has_many :user_neighborhoods
    has_many :users, through: :user_neighborhoods
    validates :state, presence: true,  length: {in: 2..30}
    validates :neighborhood_name, presence: true, uniqueness: true, length: {in: 3..30}
    validates :city, presence: true, length: {in: 3..50}
end