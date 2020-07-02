class AddAddressToVoters < ActiveRecord::Migration[6.0]
  def change
      add_column :voters, :address, :string, default:"No Address"
  end
end
