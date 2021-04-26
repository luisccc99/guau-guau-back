class FixColumName < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :photo, :publi_photo
  end
end
