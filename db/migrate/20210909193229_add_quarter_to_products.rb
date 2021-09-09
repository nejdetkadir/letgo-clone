class AddQuarterToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :quarter, null: false, foreign_key: true
  end
end
