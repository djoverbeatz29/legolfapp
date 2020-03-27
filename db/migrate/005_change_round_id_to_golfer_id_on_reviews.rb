class ChangeRoundIdToGolferIdOnReviews < ActiveRecord::Migration[5.2]
    def change
        rename_column :reviews, :round_id, :golfer_id
    end
end