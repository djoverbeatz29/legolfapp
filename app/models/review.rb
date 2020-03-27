class Review < ApplicationRecord
    belongs_to :course
    belongs_to :golfer

    validates :rating, :inclusion => 0..10
end