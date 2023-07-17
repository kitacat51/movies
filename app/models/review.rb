class Review < ApplicationRecord
    belongs_to :movie
    belongs_to :user
    has_many :comments
    
    validates :review_contents, presence: true
    
end
