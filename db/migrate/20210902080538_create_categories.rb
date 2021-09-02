class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false, default: ""
      t.string :icon, null: false, default: ""
      t.string :color, null: false, default: ""
      t.boolean :is_public, default: true

      t.timestamps
    end
  end
end
