class ChangeColumn < ActiveRecord::Migration[6.0]
    def change
        change_column :voters, :sign, :string, default: ""
        change_column :voters, :volunteer, :string, default: ""
    end
end
