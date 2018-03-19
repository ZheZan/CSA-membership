class CreatePointRules < ActiveRecord::Migration
  def change
    create_table :point_rules do |t|
      t.string :name
      t.integer :score

      t.timestamps null: false
    end
  end
end
