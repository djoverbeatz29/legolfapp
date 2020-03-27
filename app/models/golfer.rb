class Golfer < ApplicationRecord
    has_many :rounds
    has_many :reviews
    has_many :courses, through: :rounds
    has_secure_password

    validates :email, presence: true, uniqueness: true

    # def instance_variables
    #     @scored_rounds = self.rounds.find_all { |ro| ro.score }
    #     @scores = @scored_rounds.map { |ro| ro.score }
    #     @scores_vs_par = @scored_rounds.map { |ro| self.score_vs_par(ro) }
    # end

    def score_vs_par(round)
        round.score ? round.score - round.course.par : nil
    end

    def average_score
        rounds = self.rounds.find_all { |ro| ro.score }
        scores = rounds.map { |ro| ro.score }
        scores.any? ? scores.sum / scores.length : "N/A"
    end

    def handicap
        rounds = self.rounds.find_all { |ro| ro.score }
        scores_vs_par = rounds.map { |ro| self.score_vs_par(ro) }
        scores_vs_par.any? ? scores_vs_par.sum / scores_vs_par.length : "N/A"
    end

end