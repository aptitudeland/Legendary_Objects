class CreateLegends < ActiveRecord::Migration[7.1]
  def change
    create_table :legends do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
