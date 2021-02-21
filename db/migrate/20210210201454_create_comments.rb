class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :body, null: false
      t.belongs_to :post, foreign_key: true, type: :string
      t.belongs_to :user, foreign_key: true, type: :string
      t.timestamps
      
    end
  end
end
