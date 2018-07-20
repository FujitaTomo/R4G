class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :admin_id
      t.string :title
      t.integer :price
      t.integer :genre_id
      t.integer :label_id
      t.integer :rating_id
      t.text :image_id
      t.date :sale_date
      t.text :amazon
      t.text :official

      t.timestamps
    end
  end
end
