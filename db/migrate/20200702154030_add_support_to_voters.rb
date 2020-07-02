class AddSupportToVoters < ActiveRecord::Migration[6.0]
  def change
      add_column :voters, :support, :string
  end
end
