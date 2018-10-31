class AddReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :post
    # add_reference :comments, :programmer, foreign_key: true
    add_reference :posts, :programmer
  end
end
