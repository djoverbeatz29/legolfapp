class CreateCourses < ActiveRecord::Migration[5.2]
    def change
        create_table :courses do |t|
            t.string :name
            t.integer :par
            t.text :description
        end
    end
end