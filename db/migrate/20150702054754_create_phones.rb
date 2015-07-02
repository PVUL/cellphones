class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.belongs_to :brand, null: false
      t.integer :year, null: false
      t.string :battery, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
