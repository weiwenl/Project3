class AddPhotoUrlToProgrammers < ActiveRecord::Migration[5.2]
  def change
    add_column :programmers, :photo_url, :text
  end
end
