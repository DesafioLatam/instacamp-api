class AddUserToCaptures < ActiveRecord::Migration
  def change
    add_reference :captures, :user, index: true, foreign_key: true
  end
end
