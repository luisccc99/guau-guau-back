class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :body, null: false
      t.belongs_to :post, index: true
      t.belongs_to :user, index: true
      t.timestamps
      
    end
  end
end
