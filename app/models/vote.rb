class Vote < ApplicationRecord
  belongs_to :commentable, polymorphic: true
end
