class CreateComment < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :post, foregin_key: true
      t.references :commentor, foregin_key: { to_table: :users }

      t.text :comment

      t.timestamps
    end
  end
end
