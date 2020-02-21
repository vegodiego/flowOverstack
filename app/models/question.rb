class Question < ApplicationRecord
    has_many :answers
    belongs_to :user
    has_many :votes, as: :commentable
    has_many :comments, as: :commentable
    validates :content, presence: true
    validates :title, presence: true
end
