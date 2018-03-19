class CreateDynasties < ActiveRecord::Migration
  def change
    create_table :dynasties do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
