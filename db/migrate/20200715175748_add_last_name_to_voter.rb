class AddLastNameToVoter < ActiveRecord::Migration[6.0]
  def change
    add_column :voters, :last_name, :string
    add_column :voters, :middle_name, :string, default: ""
    change_column :voters, :name, :first_name
  end
end
