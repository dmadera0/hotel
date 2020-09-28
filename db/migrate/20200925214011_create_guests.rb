class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string :username
      t.integer :party_size
      t.string :password_digest 

      t.timestamps
    end
  end
end
