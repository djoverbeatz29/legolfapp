class CreateReviews < ActiveRecord::Migration[5.2]
    def change
        create_table :reviews do |t|
            t.integer :rating
            t.string :title
            t.text :content
            t.integer :round_id
            t.integer :course_id
        end
    end
end