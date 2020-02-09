class Answer < ApplicationRecord
	belongs_to :question
	has_many :votes, as: :commentable
	has_many :comments, as: :commentable
	validates :content, presence: true
end
