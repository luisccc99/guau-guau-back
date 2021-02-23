class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, id: :uuid do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :photo
      t.boolean :resolved, default: false
      t.string :resolved_reason, default: false
      
      t.belongs_to :user, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
