class CreateVoters < ActiveRecord::Migration[6.0]
  def change
    create_table :voters do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.datetime :last_called
      t.boolean :sign, default: false
      t.string :status, default: "not called"
      t.boolean :volunteer, default:false

      t.timestamps
    end
  end
end
