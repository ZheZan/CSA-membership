class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uin
      t.string :tel
      t.string :email
      t.string :membership
      t.string :shirt
      t.string :classification
      t.string :dynasty

      t.timestamps null: false
    end
  end
end
