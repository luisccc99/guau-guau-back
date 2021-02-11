class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, id: :uuid do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :photo
      t.boolean :resolved
      t.string :resolved_reason
      
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
