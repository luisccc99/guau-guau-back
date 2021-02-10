class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.text :name
      t.text :lastname
      t.integer :num_posts
      t.integer :resolved_posts

      t.timestamps
    end
  end
end
