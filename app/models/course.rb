class Course < ApplicationRecord
    has_many :rounds
    has_many :golfers, through: :rounds
    has_many :reviews, source: :rounds

    def review_count
        self.reviews.count
    end

    def average_rating
        if self.reviews.empty?
            "N/A"
        else
            ratings = self.reviews.map { |rev| rev.rating }.find_all { |rat| !!rat }
            1.0 * ratings.sum / ratings.length
        end
    end

    def score_count
        self.rounds.find_all {|ro| ro.score }.count
    end

    def average_score
        if self.rounds.empty?
            return "N/A"
        else
            scores = self.rounds.find_all { |ro| ro.score }.map { |ro| ro.score }
            return 1.0 * scores.sum / scores.length
        end
    end

end