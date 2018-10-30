class RemoveProgrammerIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :programmer_id, :string
  end
end
