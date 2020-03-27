class RemoveColumnUsername < ActiveRecord::Migration[5.2]
    def change
        remove_column :golfers, :username
    end
end