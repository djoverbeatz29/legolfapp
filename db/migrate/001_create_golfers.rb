class CreateGolfers < ActiveRecord::Migration[5.2]
    def change
        create_table :golfers do |t|
            t.string :name
            t.string :email
            t.string :username
            t.string :password_digest
        end
    end
end