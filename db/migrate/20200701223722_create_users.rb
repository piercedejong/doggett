class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, :primary_key => :uuid do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.timestamps
    end
    change_column :users, :uuid, :string
  end
end
