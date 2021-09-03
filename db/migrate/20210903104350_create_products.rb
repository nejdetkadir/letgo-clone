class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price, :precision => 10, :scale => 2
      t.json :images
      t.string :cover
      t.integer :status
      t.integer :view_count, default: 0

      t.timestamps
    end
  end
end
