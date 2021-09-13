class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.references :product, null: false, foreign_key: true
      t.references :from, null: false, foreign_key: { to_table: :users }
      t.references :to, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
