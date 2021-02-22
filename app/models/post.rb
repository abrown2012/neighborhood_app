class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :neighborhood
    has_many :comments
    validates :title, presence: true, length: {in: 2..300}
    validates :text, presence: true, length: {in: 3..2000}
end