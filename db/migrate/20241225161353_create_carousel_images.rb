class CreateCarouselImages < ActiveRecord::Migration[8.0]
  def change
    create_table :carousel_images do |t|
      t.string :section, null: false
      t.string :title
      t.text :description
      t.integer :display_order, null: false
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :carousel_images, :section
    add_index :carousel_images, :display_order
  end
end
