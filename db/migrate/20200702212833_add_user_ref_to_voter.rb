class AddUserRefToVoter < ActiveRecord::Migration[6.0]
  def change
    add_column :voters, :user_id, :string
  end
end
