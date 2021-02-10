class CreateLocalizations < ActiveRecord::Migration[6.0]
  def change
    create_table :localizations, id: :uuid do |t|
      t.string :X
      t.string :Y

      t.timestamps
    end
  end
end
