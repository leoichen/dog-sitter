class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.text :bio
      t.string :gender
      t.integer :age
      t.string :language
      t.string :phone_number
      t.integer :price

      t.timestamps
    end
  end
end
