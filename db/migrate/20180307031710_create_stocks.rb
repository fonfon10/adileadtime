class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.integer :leadtime
      t.references :part_number, foreign_key: true

      t.timestamps
    end
  end
end
