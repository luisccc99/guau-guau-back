class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :name, null: false
      t.string :lastname, null: false
      t.integer :num_posts
      t.integer :resolved_posts

      t.timestamps
    end
  end
end
