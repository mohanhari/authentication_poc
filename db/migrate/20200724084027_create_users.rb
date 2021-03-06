class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      t.string :email_confirmation_token, limit: 128, null: false, default: ''
      t.datetime :email_confirmation_at
      t.string :first_name, null: false
      t.string :city, null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
