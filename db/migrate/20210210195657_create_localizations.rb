class CreateLocalizations < ActiveRecord::Migration[6.0]
  def change
    create_table :localizations, id: :uuid do |t|
      t.decimal :X, null: false
      t.decimal :Y, null: false
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
