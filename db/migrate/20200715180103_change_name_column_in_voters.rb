class ChangeNameColumnInVoters < ActiveRecord::Migration[6.0]
  def change
      rename_column :voters, :name, :first_name
  end
end
