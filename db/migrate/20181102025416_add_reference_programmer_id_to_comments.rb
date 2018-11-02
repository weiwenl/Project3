class AddReferenceProgrammerIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :programmer
  end
end
