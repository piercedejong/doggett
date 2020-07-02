class SetDefaultStatusForVoter < ActiveRecord::Migration[6.0]
  def change
      change_column :voters, :status, :string, default: "Not Called Yet"
  end
end
