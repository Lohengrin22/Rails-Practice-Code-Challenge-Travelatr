class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, :bio, :age, presence: true
    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 31}

    def total_likes
        total_likes = 0
        self.posts.each do |post|
            post.likes += total_likes
        end
        total_likes
    end 
end
