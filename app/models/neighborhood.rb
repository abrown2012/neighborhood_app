class Neighborhood < ActiveRecord::Base
    belongs_to :post 
    belongs_to :user
    validates :state, presence: true,  length: {in: 2..30}
    validates :neighborhood_name, presence: true, length: {in: 3..30}
    validates :city, presence: true, length: {in: 3..50}
end