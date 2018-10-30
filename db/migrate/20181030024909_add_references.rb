class AddReferences < ActiveRecord::Migration[5.2]
  def change
  	add_reference :comments, :post, foreign_key: true
    add_reference :comments, :programmer, foreign_key: true
    add_reference :posts, :programmer, foreign_key: true
  end
end
