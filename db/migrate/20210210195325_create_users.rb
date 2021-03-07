class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :photo
      t.text :aboutme, default: "This is the start of a great adventure rescuing dogs!"
      t.integer :num_posts, default: 0
      t.integer :resolved_posts, default: 0

      t.timestamps
    end
  end
end
