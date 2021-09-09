class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :alpha_2_code

      t.timestamps
    end
  end
end
