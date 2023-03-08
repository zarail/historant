class CreateMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_items do |t|
      t.string :category
      t.string :name
      t.float :price
      t.date :visit_date
      t.integer :rating
      t.text :description
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
