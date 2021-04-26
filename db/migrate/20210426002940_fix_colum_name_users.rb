class FixColumNameUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :photo, :user_photo
  end
end
