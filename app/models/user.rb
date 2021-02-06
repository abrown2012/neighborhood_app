class User < ActiveRecord::Base
    has_secure_password
    has_many :posts
    has_many :neighborhoods, through: user_neighborhoods
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,255}))\z/i} 
    validates :name, presence: true, length: {in: 5..30}, exclusion: {in: ["admin", "superadmin", "user", "name"] }
    validates :password, presence: true, length: {in: 10..100}, confirmation: true, on: :create 
end
