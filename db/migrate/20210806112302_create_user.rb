class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name

      t.string :email, null: false
      t.string :password_digest

      t.string :api_token

      t.timestamps
    end
  end
end
