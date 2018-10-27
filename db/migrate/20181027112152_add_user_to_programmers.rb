class AddUserToProgrammers < ActiveRecord::Migration[5.2]
  def change
    add_reference :programmers, :user, foreign_key: true
  end
end
