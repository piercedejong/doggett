class AddZip5ToVoter < ActiveRecord::Migration[6.0]
  def change
    add_column :voters, :zip5, :string
    add_column :voters, :city, :string
    add_column :voters, :state, :string
  end
end
