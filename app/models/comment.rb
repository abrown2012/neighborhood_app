class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :post
    validates :content, presence: true, length: {in: 2..2000}
end