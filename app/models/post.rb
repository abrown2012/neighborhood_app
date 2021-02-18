class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :neighborhood
    validates :title, presence: true, length: {in: 2..30}
    validates :text, presence: true, length: {in: 3..1000}
end