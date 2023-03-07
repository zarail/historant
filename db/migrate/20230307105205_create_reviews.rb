class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.date :visit_date
      t.integer :rating
      t.text :description
      t.references :menu_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
