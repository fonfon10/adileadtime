class CreatePartNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :part_numbers do |t|
      t.string :partnumber

      t.timestamps
    end
  end
end
