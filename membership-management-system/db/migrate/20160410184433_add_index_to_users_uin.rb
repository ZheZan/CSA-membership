class AddIndexToUsersUin < ActiveRecord::Migration
  def change
     add_index :users, :uin, unique: true
  end
end
