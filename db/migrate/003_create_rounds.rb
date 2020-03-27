class CreateRounds < ActiveRecord::Migration[5.2]
    def change
        create_table :rounds do |t|
            t.datetime :tee_time
            t.integer :score
            t.integer :golfer_id
            t.integer :course_id
        end
    end
end