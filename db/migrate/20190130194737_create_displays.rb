class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.references :page, index: true, foreign_key: true
      t.references :block, index: true, foreign_key: true
      t.integer :order

      t.timestamps null: false
    end
  end
end
