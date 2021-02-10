class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, id: :uuid do |t|
      t.string :title
      t.text :body
      t.string :photo
      t.boolean :resolved
      t.string :resolved_reason

      t.timestamps
    end
  end
end
