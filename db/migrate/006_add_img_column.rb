class AddImgColumn < ActiveRecord::Migration[5.2]
    def change
        add_column :courses, :pic, :string
    end
end