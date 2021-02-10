class CreateLocalizations < ActiveRecord::Migration[6.0]
  def change
    create_table :localizations do |t|
      t.string :X
      t.string :Y

      t.timestamps
    end
  end
end
