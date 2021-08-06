class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, foregin_key: true

      t.timestamps
    end
  end
end
