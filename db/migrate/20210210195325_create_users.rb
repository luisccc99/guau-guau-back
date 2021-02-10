class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :lastname
      t.integer :num_posts
      t.integer :resolved_posts

      t.timestamps
    end
  end
end
